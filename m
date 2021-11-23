Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6B045A784
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229729.397241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYZC-0006u2-42; Tue, 23 Nov 2021 16:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229729.397241; Tue, 23 Nov 2021 16:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYZC-0006rT-0Y; Tue, 23 Nov 2021 16:22:46 +0000
Received: by outflank-mailman (input) for mailman id 229729;
 Tue, 23 Nov 2021 16:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xsi5=QK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mpYZA-0006RI-7f
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:22:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94f6b9c8-4c79-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 17:22:43 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 94f6b9c8-4c79-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637684563;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=bdCFgC4VsmA6Y60Jj+c5NxkNjUDcy+5vjQghbqi/Jso=;
  b=Mtwsr+EUmzOCfXrn/Si9nnnjxdxh5WuH/JHXk3q8RN8IB3DnX2EoCf/t
   4ctYRyfbcq4npKzOOLDLC2nOEYiapd23JgH7cTT0NA9MgS9BRxS9+LJoE
   7ReO8IbKraVwWF3jS7ZXSQU9emgo7/9ktfzQdX101IGLo/ihZrBhz5X7j
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: F455lNHkRNZflwOiQsuSnsQMwe2i88vXa/7luDdljiMskFvOxotrISFzBjmMPjjN59PS+jnxml
 0jQENPBLFvaXhe8oOKSlp/+A6txOlybv6dM2RECe9oiA29K3KxGh2Fz5rfweVJbTa4FQW0iyuY
 mDCbWL2lT8VBFy0D1TiBm+2nqnyacVE7UsiZrl2+ZSGz3w6zyhgSsgR8emM/Gxup7dtMmPnLlG
 inXzJHX2ZHCxu+pIV8B7fxBwzrJLV0KMD2AsN29Q3zm38iqXCDjfpx0/dKYYyunVYgKr4kTWvh
 H6OFCkCWzomijun6fU8UshwD
X-SBRS: 5.1
X-MesageID: 58466136
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:4xJZIaPx4gzJlcBcT1v155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcPY9ds2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.87,258,1631592000"; 
   d="scan'208";a="58466136"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRUSBmVAF0/MJssUd+xXOK6lTScYPxQeIXcbLXOFZNaAXwahqTnJoTcboP/6UxbNLTX0JsyhU8wsE08wIsXzgrkWNkNs6n7AOgE+AfUfLow5MieCG1Dfxt7cvz96jd1IursvuGR8bsWnMwIXc7k1IwNE+FrxEvlAqJmgnT3/J1ZjSctMmnQSpxLr5HBMZ/3xM07FJEp6pgVK5zf3akgUa0FbVbEApFLwKPtPKBClxkz1H+V6A8hJl4Bwt7aF8WJlHsUDKosFActHgbcDeQoqCleIE51ToUT0Ffqrea1awzrmbxI3pVxmaHDN3E+Mio6ln/Ygk4syU6YDg7ywWTfe1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5cSvHwx5mRuoUuZYmyA3IWwqycmpxyoNT0Z7Sj1WLg=;
 b=NcxGbzHul6lTuXiZesveeoiS4bL5nF0ImX26TKo2rWmlm+J/Y86GhbuK+HI2mv1iMScqdFNQolMtPNftGL4oHl8yzXeuTkRnYDMCa3/QLCDO89m/6A+9JsGddI1OFlappzhmfPqtksw3H9UD4rmQkgR6KPKLGhqbw77UKG/DZ8G+bCmyZX+iGJ/DP6HdDm6D0WylMc2TGNeMH0VXsmoD7qiv84lPG/A0QLatIIffWTo+0SACDTEu3/rW30HHYqvu10rtwkixmBNjNXE4m3SFddg5NMNJyT+4Z4kBrei4oGuvfQ3ITANjmzYR/nWeP3HecH7gfceyIviAtoJLWs1HyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5cSvHwx5mRuoUuZYmyA3IWwqycmpxyoNT0Z7Sj1WLg=;
 b=rYXFzI1pZfcBUhiJy7ukBesKJZ8T/VAbU6XHvwFu5iHigRXiI3GFDIg2u6PTCY06wfYPz2NwSYKE04Xo/dR6N7cDrp59zusp/O9Rf7jtDoadeL7wzAXu+kBUDwphC2AC8ap4xSTu2XLOtuBHwi+DcJVfamCQRDso+6HgnlYXA/Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Community Manager
	<community.manager@xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Josh Whitehead <josh.whitehead@dornerworks.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>
Subject: [PATCH for-4.16 v3] CHANGELOG: add missing entries for work during the 4.16 release cycle
Date: Tue, 23 Nov 2021 17:22:27 +0100
Message-ID: <20211123162227.74606-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::33)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11db1529-0b5d-4fdc-8901-08d9ae9d7515
X-MS-TrafficTypeDiagnostic: DM5PR03MB2780:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB2780BADAC5866033D360A9C68F609@DM5PR03MB2780.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6TByioMx7z+hVCovdgfwpIzbf4fQ9y36Gf6aODG5FSlGfgboPVBxZMTe7N1tcPPV3uU8pX30S3a9xW+cZxQvcMWH66ANCThBHA1AeQjPdoa8VvBbMqo4cpQph5cy9gzLJWybKEzIF0VtdpTM9kA6GP3FZ8EnSJwYhEjK6UCI7NQUKjGAA6maWyLDbdtuxvDH03FdBN6YrsJdh7vA0sen/yi/diA9yDa4E+0Q7boInzsW0Wx9FWVlRZBpUFR3E9vR6nrQNptJFWD/wKyYrxgeWNG7JhdrrJwz+DMo9uJDZ9qS6u2r941Sj5ui+ZNHCvHL9nvDP8JQm4sjaRE71n5WeLTRoTfY4wjiqY+saZZ7CuM8ychv/TKsngrnFJ02VEwl7wtGQzEqQqPrVcHpCkMEsOtYsfcEKVqRFAmRiPgyeQl4GKi/yoDR/+WnyP+MmOvt/oXcpj/ez++MeLqoKYKuzeP7oe6opMnQhvnliFXC7HbB6LkNeFfonoSDEfbfuFVnDTwyCe4d4q/f79gId5HW4lprLFc9ZTF8fIypnJtYjDcDWkGojxeaGvMKGWykOKysIUXT2d1FOnDgR4JhAzG5ZjtmG/f4e+LSs8xxpaa2VQHz4YYiMijRwA4ST/zWmbvseKiucE17YpIyQSfwEBTdcsJ16lCTpIqMiFfukdWVPn5Ot6mvBkR+F0pWHet9t7ytO10D/inuvrLI+qgbHiomcRWp2YiupGC7EuyiFZGGMvcFc3QTzlUArPQonZwYLLLp/C552RdD5DzDFTr5aNW2EZ/z2xjAbjJMGuFZSBn6PyskIYFSWH+vG2lfvwtLZSEaLXR2+yqamn9E7AQucURM5JyLVdAGYj6Tvr44POb9Jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(36756003)(4326008)(508600001)(26005)(186003)(66574015)(2616005)(956004)(7406005)(7416002)(83380400001)(2906002)(316002)(86362001)(54906003)(66556008)(66476007)(66946007)(6496006)(8936002)(8676002)(6666004)(82960400001)(6486002)(5660300002)(6916009)(1076003)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDVkSFhJNDkyZ3k3NmNtOTQ4K0lXeno1b1loU1RIK29GMFlsN0M2b3BkWnJE?=
 =?utf-8?B?Tkc3VzNpRUR0eGV1TFMvbnpiY0xxVURCQlRzSlBnWmVxVVNqZm1RM2ZnNWVt?=
 =?utf-8?B?TEV4VXdoOHFTcjhzNVRZeW9MYy9TQ0J2eG9GSCs2UjI4YVplNjFxMFNnT0lv?=
 =?utf-8?B?TTlaQnUvWCtyL0p2VHl0UWVmbmkva3A1MnN3SVNHd2g5MS9lZ3k1TXZ2OWVp?=
 =?utf-8?B?d2w5ZkxVUHkvU1Jkb1J4MEVCSWt2Y3ZWSWUweldqSEZxT3EreDNxTHdaQis0?=
 =?utf-8?B?QXNnc204Uk5XaVdvc1Y5NGZ1eVVpN09RYm9FSzhITUZLdHZtN1B0TGhYUWdE?=
 =?utf-8?B?R2VUL1BhRkdzYWVweGdCUFF6NXB2bnh4UWlhTmNranRSaW40NDNmcnM2MS9t?=
 =?utf-8?B?R3J3SVMzS3BOV2JZL3RzUm5idU9zaUJGckNrZTRYeUVIQ3c0VkVQZzIxNk41?=
 =?utf-8?B?K1hkUFp1VThqQmpKZHdUY1FEMkdZSjhHRk1YZ3o1UW1aRjFWRElwY1FUMFJI?=
 =?utf-8?B?dHZZc0J1T0JMeUdJSGFjNkllUEVBR3JyV3lCRVo5QnFRd0paSmZBT3dpWDVa?=
 =?utf-8?B?RTFFbEM1Q1ZyOU5DV2YyWVQ4SXVuTXVtR1FrY1hlb21UcCtxYi9rSFhRVC90?=
 =?utf-8?B?amxKYWJodjlnRy8vRG9BOW95RTRBNDNRMUxzWjBzY0NRTk8zRVJLTEpKWlYw?=
 =?utf-8?B?ZE1tRzQyKysvZ0ErTStjNmtJZHFWQkRtcG5lQjd1QzFGYjRxTDR0YVJUdllq?=
 =?utf-8?B?TlpvK1F6WVQ5UzQxSFVwemRpcWhtNHJwYjRKdE5zTWo1WjIyb2IvZGgraWZk?=
 =?utf-8?B?L3pQWGpTRVZndm5VRWpmTjQvVGVNVjlhWHh2empBSmNBb0l4Smg3bmxDejlq?=
 =?utf-8?B?MWIwR0NmbStscWlWcDlJUUw0bVJPWGZ0WVN5T05OSnVaWnl0V3ZPc0orV0R2?=
 =?utf-8?B?OHJTeFFyN1dkRFk2QnJIcHREVTFkc1Rlb1VXSWVMV2ZVQlluVTNmUmQ0Q0NN?=
 =?utf-8?B?L0EwUHlCdVA5M3BJSkxHTTNnR0NiSnd2MWhKOVh5MnZsTFp4SERTZFQ5WmVy?=
 =?utf-8?B?djhuVDZyTXRKUkkzRmt0dnRhYll3NFZPb2h3TnJwMGt1dDdBQUg1a3ROa0pl?=
 =?utf-8?B?ZW1NRGlMK3plQkFvd1lidUlvOGVuNzJxaW9OSGhCbEloOXk0cmg1MENaQlp6?=
 =?utf-8?B?Nko4Vi9IWmNpL1FQRzRRZ3E3K1FFUzViOWpnS0E3SmJKbzhkSHRMODdFcDZI?=
 =?utf-8?B?YU1YaUlocm5tZGRXanFGazVhMk1vL3U5VVl1ZDRvZkkraUJVYkRQZzBUaWU1?=
 =?utf-8?B?Rmowc2M5ekJ5WEtEaVZENkRtVDVGdkZKb0daTzJmS1R4NGdHdVphbllidFJv?=
 =?utf-8?B?MytRK1VGRERIVWV3T2pUQStUYzRiaTJmNGRnZTFxV2dpS2d4K0gxMVBVUnF2?=
 =?utf-8?B?bCtlL0hWNTNIKzFqV21HaVFXbjlkT2dlUjJMK1podG1DV1A5SzZtb2VTRklM?=
 =?utf-8?B?TW1pSkIvOHBFV0hFbE13YThBQWZtaDNPL3c2MGMxUjJFME5EYUZhNy9rUkx6?=
 =?utf-8?B?dmRSNU5JdHA4QUd4OHhWN3dSZTVzV0hDdi9xZjNwdmcrTlFWQXJoYVBzZHJY?=
 =?utf-8?B?UHU1bDdZOXI3Yk90VXVyUFlYTzhLZ0huYm1DVkFHcUdQeHU4MWNrL2d5K1dp?=
 =?utf-8?B?WGFldGdhbmdhTHE4T0pKUVJPcWhjMnZmY0NEMzF6MklIWjI4SHIxbU1IekM5?=
 =?utf-8?B?ZjFDd3VKM1FPMzhwTXNVejVpUjNNQzJiVllhOWRhTGxOQU4zbTc3bWJZbXNw?=
 =?utf-8?B?cU9YYjhFeWhOcEQxaElWTlR5N0pGdHdtWHgxYWJKU1ZMSFFBQ1U2WG91YkFM?=
 =?utf-8?B?NVZPVnRnNFFYckNkV2ZseVAySDl5UG1sMmhtQVYxQVpsQkN2RU10dnlkUTkx?=
 =?utf-8?B?Mit0NEZ0em15VUVETEdpTDBIVDAxeGN0c0tVSVBuUGplVnptSld2bG43b1J3?=
 =?utf-8?B?eUlLamg1QUgzSmtDY1pEUnRXaldXcG1seXFnMU5vQWVTbGtRZFU1YzhteGtC?=
 =?utf-8?B?V3FEOU1vdUt0Ylk5VWxQTHdDWFRvaDRtdVMvVC9IekQ4cDVoeC9jemlEOXlR?=
 =?utf-8?B?UngrWHhUVVZOeE5RSGhnTUYxR0ROTC94UGNTQVZTaXNic1pnUlFCSXEzcnZZ?=
 =?utf-8?Q?U9zjnyKN15eVNtiYg7W3o48=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11db1529-0b5d-4fdc-8901-08d9ae9d7515
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 16:22:34.8702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewWhTXPaqtYEYlM3qjSm0J2IGdQjBpfXmW2OdGkBDhGS2HmekYhJP1ttVvjMHCEvMxiJHeJujwPJjcC2k/TA/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2780
X-OriginatorOrg: citrix.com

Document some of the relevant changes during the 4.16 release cycle.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Changes since v2:
 - Reword the x86 page table API change.

Changes since v1:
 - Add qemu-traditional and pvgrub notes.
 - Expand vPMU support to note it's limited.
 - xenstore library API changes.
 - xencall2L addition.
 - gitlab CI changes.
 - dom0less improvements.
 - vGIC fixes.
 - New Arm features.
 - OP-TEE fixes.
 - Arm64 heterogeneous CPU support.
---
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: David Scott <dave@recoil.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Josh Whitehead <josh.whitehead@dornerworks.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Meng Xu <mengxu@cis.upenn.edu>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Quan Xu <quan.xu0@gmail.com>
Cc: Rahul Singh <rahul.singh@arm.com>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Shriram Rajagopalan <rshriram@cs.ubc.ca>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tim Deegan <tim@xen.org>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
---
 CHANGELOG.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ad1a8c2bc2..d312ddf627 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,32 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
    no longer be built per default. In order to be able to use those, configure needs to
    be called with "--enable-qemu-traditional" as parameter.
+ - Fixes for credit2 scheduler stability in corner case conditions.
+ - Ongoing improvements in the hypervisor build system.
+ - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
+ - 32bit PV guests only supported in shim mode.
+ - Improved PVH dom0 debug key handling.
+ - Fix booting on some Intel systems without a PIT (i8254).
+ - Do not build qemu-traditional or pvgrub by default.
+ - Cleanup of the xenstore library interface.
+ - Fix truncation of return value from xencall2 by introducing a new helper
+   that returns a long instead.
+ - Fix system register accesses on Arm to use the proper 32/64bit access size.
+ - Various fixes for Arm OP-TEE mediator.
+ - Switch to domheap for Xen page tables.
+
+### Added
+ - 32bit Arm builds to the gitlab-ci automated tests.
+ - x86 full system tests to the gitlab-ci automated tests.
+ - Arm limited vPMU support for guests.
+ - Static physical memory allocation for dom0less on arm64.
+ - dom0less EFI support on arm64.
+ - GICD_ICPENDR register handling in vGIC emulation to support Zephyr OS.
+ - CPU feature leveling on arm64 platform with heterogeneous cores.
+ - Report unpopulated memory regions safe to use for external mappings, Arm and
+   device tree only.
+ - Support of generic DT IOMMU bindings for Arm SMMU v2.
+ - Limit grant table version on a per-domain basis.
 
 ## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
 
-- 
2.33.0


