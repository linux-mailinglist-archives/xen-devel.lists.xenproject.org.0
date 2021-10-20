Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20884347AA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 11:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213722.372029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md7aQ-0008UR-Iw; Wed, 20 Oct 2021 09:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213722.372029; Wed, 20 Oct 2021 09:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md7aQ-0008RO-Er; Wed, 20 Oct 2021 09:08:38 +0000
Received: by outflank-mailman (input) for mailman id 213722;
 Wed, 20 Oct 2021 09:08:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ou1c=PI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1md7aO-0008RI-Tl
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 09:08:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dcd8d80-3185-11ec-8335-12813bfff9fa;
 Wed, 20 Oct 2021 09:08:35 +0000 (UTC)
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
X-Inumbo-ID: 4dcd8d80-3185-11ec-8335-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634720916;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+kD6C60QGEDF9D8DiEac5gIDV8SSJIex7m80SY2DSno=;
  b=bKVFjIafrZpiWnf9sBPQojYwgHxpaDLPJW//RrIK+u24w4edEhBHMve5
   FcrKN13JQdyx7ZD/3favCALaBmotkxKQ4dET/ux9AYXPhyxQ79T0qQh4y
   vmwt5HyJbo4olvdGRdzr03ARvGgzxV5UPKY8fQAJTqN74EAw3bZP0uzz1
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JMEpAXFCPdjWN8+R0mz6xvZefkT4ZQniu1dfoHwsLc25yEI4ymwuXyJpjXmbb2M9BAqeyoEBp3
 abfV8H3lQ+6wmQaU/uhIlUTxFmEb91gxVxyZHXZwFsVOpuBW/Dt07Xunnhn40eLRf9ciUxB5ys
 t2q3CWaqdlU/3PwQJ7vOYtoMOAFNTbAb+HFzn9699NFiuHeA5j9a4VvN+I1Paqvr5Ms8TYx7oV
 kgAbq73iAxE1C0uKZQJ7wV0QXEtKISigpyc9U1AD20YVrIgjwBvAfgkZNjmyOmsqFzq3k0KOtd
 F3XxNtVmKmdu00zpu3QFsM6j
X-SBRS: 5.1
X-MesageID: 55645276
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/Fc0Eax3Jxq/Cl0IQxl6t+cywCrEfRIJ4+MujC+fZmUNrF6WrkVUm
 DNLXTqEaKuCNDfzf4x1PorkoxgF7cCGm98xTgRrrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6w7Rh2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/9A6
 49RnMKbcg0OZqzMvMJBUgR/OQgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIFgmtt3J8QdRrYT
 8UWVwg/NS/PWTwVFggMT6w6jMmmmECqJlW0r3rK/PFqsgA/1jdZ0qXpMdfTUsyHQ4NShEnwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcLwVELq05/t7mmq5z2YYCAAVfVajqPz/gUm7M/pHI
 lEQ0jojq+417kPDZsb5dw21pjiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJhZrZcY6rsYwSXoP3
 0WQgtLyLTV1tfueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adqdn4Gir5x
 TyQmwE4i68Ols4A16i9/lfvjiqlo97CSQtdzgTIXEq14wVhfomnaoe0r1/B4p59wJ2xFwfb+
 iJewo7Hsb5IXcrleDGxrPslM4CKveqsbhbni3k3HpkF0Wis5lmJVNUFiN1hH3tBPsEBcD7vR
 UbcvwJN+ZNeVEeXgb9Lj5GZUJtyk/CxfTjxfrWNNIAWO8kuHOOS1Hg2PRb44oz7rKQ7fUjT0
 7+gesGwEW1SN61jyDenLwv2+e52nn5grY8/qJaS8vhG7VZ8TCLKIVvmGAHXBgzc0E9iiF+Jm
 zq4H5DSoyizqMWkPkHqHXc7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPmu9/Jd09xfgNz76gE
 pSBtqlwkgaXaZrvcl3iV5yeQOm3AcYXQYwTbETAwmpEK1B8ON3yvc/zhrM8fKU99fwL8BKHZ
 6JtRil0OdwWEm6v021ENfHV9dU+HDz21VPmF3f0O1AXIs8/LzElD/e5J2MDAgFVVXHp3Sb/y
 pX9vj7mrW0rHVoyV5iINarzlTtcfxE1wYpPYqcBGfEKEG3E+4l2MS3hyPgxJsAHMxLYwTWGk
 Q2RBH8lSSPl+efZKfHF2vKJqZmHCex7EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc68SAwRKQMpY/6tz/YRnjWOv/05LF+jvH18/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L13kG+X6NI3oMV7QcmqsbWIK72BA2zlxiYIDHDnOk6p+4dNgRYFIhJ
 SWZhfSeiu0ElFbCaXc6CVPEwfFZ2cYVoBlPwVIPewaJl97CiqNl1RFd621qHAFczxEB2ONvI
 Gl7cUZyIPzWrTtvgcFCWUGqGh1AW0LFqhCglQNRmT2LVVSsW0zMMHY5aLSE800u+m5BeiRWo
 eODw2H/XDe2JMz800Peg6K+RyAPmTCpyjD/pQ==
IronPort-HdrOrdr: A9a23:+mT2dawXxuwU38kPA3c1KrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,166,1631592000"; 
   d="scan'208";a="55645276"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTpq0jLqYTK09UK/oqs4hm+GNC88g22d0HbS+d2zeeGWX+L7i8GTSASVIhGaXzzLXhJkOrW7Net16M/emiSTNTmURxSPa3/3BvSvHgCTtYeGvR7v5L5msVAO5jXlJQirg0C2eoXll1QuOFxulCKhLwXfCLu4cAW8bnfoa6XBtwPc2X1T+9yBaFf8ij8+KNOF+rFKvxTGGtoikKVJCRu1NHa9Gen3JFw8cMIKIn9ytnAs6k6qT1uwpVPe2rY7JKz1lnOASqkYiXm+2mTDmkgSRNLM874fvH3tzmK6dZh2Hkql3lTxZdZIxPsKf4fpC0B5G5Hgye1UJ1PqV9EGtsbF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQysufxIcVu0sj5uW1EiE+Sir2oDSC3TjyAutGn7T0k=;
 b=fO1AIg2Eqk7EhaL6YlcOm24o72+3et5iAz/1Som3l0q+4pVmIk46d7ctBYpylwrBlyKXETjwsrxDZxwlnK2YByCfwU2oMe1lZpNSTWxlRT1M69jYNX8mtOqU4QNbnt37pCkCRb0LaSsE9nADDvm9vAfEVyH86mrOCAVzbuZu8npDZNIWflmCFgsmgjO7rKefylMAEdFitbc92ol/Mvx+njI58KYk+hm1FKKEFUeUZKfsI3Z3h+Xje/k4XUqKbpSl2wBpKyB+iyqfUDTgeZyDB5XvFG43ZhuEPzegpQPUZ4NQ9yA83kF3MA3lTSKsR3S7IIEmrweEYg76YE2SHrujTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQysufxIcVu0sj5uW1EiE+Sir2oDSC3TjyAutGn7T0k=;
 b=KdCXFbPoK9Vzh9746WASNLXgh8eT+0Gjq0LoSrkOoFeJ/8U0Q90dpMpxn91fn6siAzDfQMTknyCIGwiX5hZNCPxLkRYUUXC+kdb5b64DxBQRJ9i1wSW5lb5TQUEotnY3+wjK32O5zHcVDIddRsQ0796/U0ejYzQS7EC3o3KOQrA=
Date: Wed, 20 Oct 2021 11:08:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
Message-ID: <YW/chLLoxhw+gyyH@MacBook-Air-de-Roger.local>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/TBnjCuRjm64nB@MacBook-Air-de-Roger.local>
 <e8f35e24-8dbe-db2c-02fd-f2290648a25a@suse.com>
 <2FAC788E-1736-450C-B9B5-BDE93E32260E@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2FAC788E-1736-450C-B9B5-BDE93E32260E@arm.com>
X-ClientProxiedBy: LO2P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94183f59-2481-4972-8592-08d993a92bb3
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590956B71E183B0696C54708FBE9@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgJWT1QoKZ93FUAtcNC6/ruzzlEgZ1Mruhe/bPgzOARJnwtUg1zDjsi1UJcbDvrcOduRsrwcOToJWoh3IFGoU5UiKv3vBMPxXIPpWbv9TddCYUKUMc24mrgHEjNnoU15eMj+VNoWUMyh05mlidO4HlPQZh3Dlnrou78keYFXrzfrDsiBSV/rT041DLEv9J1guJMMgYg1mmuHBGNzeyorziyQmNA/GJLAEDCClziS70vU7ZJpNKpeb/PIHlW08oE8E4SnvZ9SAqyGqDWHwR/AhMRp/gC6m5jIz3fBeqF6jakAqT2sXlNSi9KkM6diSbuYIDHkbEUBi0HGdF2Mbae4WDVB37VBWpKVUgErN6ODptTJVoV/Tv6vNHIXQs5LaCKZJF5rhybsTRClMcbSTXUg29hwqrLam3EGiY2HikhKXbRIqbqp+1XonQj0cXiAFrYJrXgk3nbCV/9euge4APEQwrD8qHsRtQkTg9qnTRbrh5d8rVp2cg3eJw3K2d2e56kVJzyNVwrpbxk2WidGtCf4i7VtH1DKfs1sG/yFHJ14qygj1MVL3ctqZS+BXY1BTy9Alq0lg/dRJpNaLkLVyBE68DWSYFtUcKuGx5sSHTlfkpkJg9AEU6P+vE+vJh1+w2BAJ5JcKq8D/9D4MWgVZw3rlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(85182001)(38100700002)(82960400001)(6496006)(2906002)(6486002)(53546011)(54906003)(66946007)(83380400001)(66556008)(8676002)(66476007)(5660300002)(86362001)(7416002)(186003)(8936002)(956004)(316002)(508600001)(26005)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enRBZGlvQW5Sc0VFWTZTUzZEemk4T1hsdno1U1pxcjFqYktyM2VDUVVGcldO?=
 =?utf-8?B?NzRiMXh4S2ZpcmxHeHFobXQwekpRUFZOblpnZkdzVDByaFovanRjWDhxc282?=
 =?utf-8?B?Q25DazA4VDFJcThrTUVWQXIwNS9ZNGJxNkpGUFBRYVJGSmFhQzhkc1RWWkpM?=
 =?utf-8?B?bmpWV3YvZkpiRkoreW9ERVZQY3dueWpJTHkvZCtYL0JyNlNMQVl2ZGlKcHFq?=
 =?utf-8?B?K3lmenFKYnVUeUV6R1hjSVp1WDA0WE1zSWNJWHV5VGJhTFdJYlNGTStkMm9h?=
 =?utf-8?B?NThER1p1VFphTkdUZVFMRlhEdDdwYkEvNytzakRGS3dvZ2lIV0U4USs5NDE3?=
 =?utf-8?B?MnJ3WWM2UEtlaitKYlZBTlROUkRRTUQ5Zk1UMnBOWXpJcWpPYnk2VFN5U2JI?=
 =?utf-8?B?UG9ndWxkMUF2cHNIQW5qR3FLdXpjU3ZHL0FOMnVobW93WVZxOUVWTXFoMmRi?=
 =?utf-8?B?Mk5hN0ZiZ0dyWnVOYTkwNStrTnphWFp0YUxaR1J4dEhRakczTVJzdnhrUTZL?=
 =?utf-8?B?WjJsSnNNczNVYkZKTTRLbHJON2FJNk1rWDlmcVN3TTNtNys2Mk1xbFY2WmhU?=
 =?utf-8?B?UU5vL0pkc0cveDhiTHJEMUtrVHZ1ZjliMHhONWdSbkVmSEtiZG5FYzQxNmZw?=
 =?utf-8?B?UUNVZmRCaU4ybEo5OUsvQk9vbWMySXZWTzlyM3Z5QzZkTkpSMmVGcUVvL05D?=
 =?utf-8?B?dk1FMExRdS91UXNuZWFrS1dEenlMeFNUMW9mNWRFRS9FTTRpeXA5L2VVRE5s?=
 =?utf-8?B?RWVDbkhHbDY4UnBTRDBHYnFGQW5VcXNFRnR5aHZFK0VQVFB4dEwyQk1WZHJN?=
 =?utf-8?B?eHdrTFpSNW9MZnhtdjRNMmNsMEZRaGhlY0NsbFh4eXBDb0NpVGVFcERQN2ZD?=
 =?utf-8?B?WVJKcmtnVDJEMktTbm9sNENLQnIyVk90UVViWEJtNWwxSGU1cDNoVytVUEZP?=
 =?utf-8?B?bXBjOW5hbFpOMUo4QW9WQkxhYkFZd2FMVWV0UGRkTFhhUHZCM2xGN2xOWDl5?=
 =?utf-8?B?a1dweVY2NzBVbzljMEUrMjdDeUxmTS9lQ0xINTNpZlhFb3NIK3I3bXhkcFBU?=
 =?utf-8?B?QTEyV1c5TnZTMXZUa0ErcWpMV0VpYXFaSG1MdmxMeTlvaGI5QUVyUWp2OS83?=
 =?utf-8?B?UlV2WGxjdCs2QTBUeXhuN2d3UHJQN1hyRm5VeGhRLzZDT20xN1dOc0VjbUZ3?=
 =?utf-8?B?dWhHUE1PdmtPUFM5aGJaZGVuYXQ1dEtLT2pSZm5YRGtKbmJ0dk9kSTRGS0dN?=
 =?utf-8?B?NXlMTXBLZ1locXRtaVpwQ1h3TlNmU0hSSWJPYUhNTGZzQzI4N1MrOGUxNnFH?=
 =?utf-8?B?a055L1JoaElJRktIK2NTNkZrZkw3clpWVjNMcTBkcVRYT1dFazdOb0ZlOXFD?=
 =?utf-8?B?MDB6a0lpWThnM2xPVjlmT0xXd2lpeWxNVTlhV0Vsc0lCWXpOcjQvMC83a2o5?=
 =?utf-8?B?YzQ3ZVFqbktZaVNxbjZ6cEg2UjRBMnpKR0ROWSsxSmN4MFU3azVTUEREU2xa?=
 =?utf-8?B?NVNrK1BCbzA5OWpwcENyRzBsUjV5bWhaN1JleHhRaTNnVENrTXBYL3RvcFBu?=
 =?utf-8?B?ZWp0dlUxWGdoTUZFV3J2RkQwblRoRzJqV1FPMGhJTlJNL2ErYUZIREdSdFB2?=
 =?utf-8?B?MUdVVk8yQWkwcWlUSWNrNFY2SVM0YW9TVmtlN1hJRTMrZk5YOVBUM25GbFpv?=
 =?utf-8?B?ekJlZEZSWFpSQlppaGFrc1Q2ZVl3ektwSjNTMlYvZkFCTlYxb2ljTFNNVk5n?=
 =?utf-8?Q?BL3J+UVLfPQPMGtHVtBUVaGpMKfVaWdsNzrtf7k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94183f59-2481-4972-8592-08d993a92bb3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 09:08:24.2772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Wed, Oct 20, 2021 at 08:39:48AM +0000, Bertrand Marquis wrote:
> Hi,
> 
> > On 20 Oct 2021, at 09:34, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 20.10.2021 10:27, Roger Pau Monné wrote:
> >> On Tue, Oct 19, 2021 at 05:08:28PM +0100, Bertrand Marquis wrote:
> >>> Xen might not be able to discover at boot time all devices or some devices
> >>> might appear after specific actions from dom0.
> >>> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> >>> PCI devices to Xen.
> >>> As those devices where not known from Xen before, the vpci handlers must
> >>> be properly installed during pci_device_add for x86 PVH Dom0, in the
> >>> same way as what is done currently on arm (where Xen does not detect PCI
> >>> devices but relies on Dom0 to declare them all the time).
> >>> 
> >>> So this patch is removing the ifdef protecting the call to
> >>> vpci_add_handlers and the comment which was arm specific.
> >>> 
> >>> vpci_add_handlers is called on during pci_device_add which can be called
> >>> at runtime through hypercall physdev_op.
> >>> Remove __hwdom_init as the call is not limited anymore to hardware
> >>> domain init and fix linker script to only keep vpci_array in rodata
> >>> section.
> >>> 
> >>> Add missing vpci handlers cleanup during pci_device_remove and in case
> >>> of error with iommu during pci_device_add.
> >>> 
> >>> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> >>> defined.
> >>> 
> >>> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> >>> for ARM")
> >>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>> ---
> >>> Changes in v2
> >>> - add comment suggested by Jan on top of vpci_add_handlers call
> >>> - merge the 3 patches of the serie in one patch and renamed it
> >>> - fix x86 and arm linker script to only keep vpci_array in rodata and
> >>> only when CONFIG_VPCI is set.
> >>> ---
> >>> xen/arch/arm/xen.lds.S        | 9 +--------
> >>> xen/arch/x86/xen.lds.S        | 9 +--------
> >>> xen/drivers/passthrough/pci.c | 8 ++++----
> >>> xen/drivers/vpci/vpci.c       | 2 +-
> >>> xen/include/xen/vpci.h        | 2 ++
> >>> 5 files changed, 9 insertions(+), 21 deletions(-)
> >>> 
> >>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> >>> index b773f91f1c..08016948ab 100644
> >>> --- a/xen/arch/arm/xen.lds.S
> >>> +++ b/xen/arch/arm/xen.lds.S
> >>> @@ -60,7 +60,7 @@ SECTIONS
> >>>        *(.proc.info)
> >>>        __proc_info_end = .;
> >>> 
> >>> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> >>> +#ifdef CONFIG_HAS_VPCI
> >>>        . = ALIGN(POINTER_ALIGN);
> >>>        __start_vpci_array = .;
> >>>        *(SORT(.data.vpci.*))
> >>> @@ -189,13 +189,6 @@ SECTIONS
> >>>        *(.init_array)
> >>>        *(SORT(.init_array.*))
> >>>        __ctors_end = .;
> >>> -
> >>> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> >>> -       . = ALIGN(POINTER_ALIGN);
> >>> -       __start_vpci_array = .;
> >>> -       *(SORT(.data.vpci.*))
> >>> -       __end_vpci_array = .;
> >>> -#endif
> >>>   } :text
> >>>   __init_end_efi = .;
> >>>   . = ALIGN(STACK_SIZE);
> >>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> >>> index 11b1da2154..87e344d4dd 100644
> >>> --- a/xen/arch/x86/xen.lds.S
> >>> +++ b/xen/arch/x86/xen.lds.S
> >>> @@ -134,7 +134,7 @@ SECTIONS
> >>>        *(.ex_table.pre)
> >>>        __stop___pre_ex_table = .;
> >>> 
> >>> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> >>> +#ifdef CONFIG_HAS_VPCI
> >>>        . = ALIGN(POINTER_ALIGN);
> >>>        __start_vpci_array = .;
> >>>        *(SORT(.data.vpci.*))
> >>> @@ -247,13 +247,6 @@ SECTIONS
> >>>        *(.init_array)
> >>>        *(SORT(.init_array.*))
> >>>        __ctors_end = .;
> >>> -
> >>> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> >>> -       . = ALIGN(POINTER_ALIGN);
> >>> -       __start_vpci_array = .;
> >>> -       *(SORT(.data.vpci.*))
> >>> -       __end_vpci_array = .;
> >>> -#endif
> >>>   } PHDR(text)
> >>> 
> >>>   . = ALIGN(SECTION_ALIGN);
> >>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> >>> index 35e0190796..8928a1c07d 100644
> >>> --- a/xen/drivers/passthrough/pci.c
> >>> +++ b/xen/drivers/passthrough/pci.c
> >>> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>>     if ( !pdev->domain )
> >>>     {
> >>>         pdev->domain = hardware_domain;
> >>> -#ifdef CONFIG_ARM
> >>>         /*
> >>> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> >>> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> >>> +         * For devices not discovered by Xen during boot, add vPCI handlers
> >>> +         * when Dom0 first informs Xen about such devices.
> >>>          */
> >>>         ret = vpci_add_handlers(pdev);
> >>>         if ( ret )
> >> 
> >> Sorry to be a pain, but I think this placement of the call to
> >> vpci_add_handlers is bogus and should instead be done strictly after
> >> the device has been added to the hardware_domain->pdev_list list.
> >> 
> >> Otherwise the loop over domain->pdev_list (for_each_pdev) in
> >> modify_bars won't be able to find the device and hit the assert below
> >> it. That can happen in vpci_add_handlers as it will call init_bars
> >> which in turn will call into modify_bars if memory decoding is enabled
> >> for the device.
> > 
> > Oh, good point. And I should have thought of this myself, given that
> > I did hit that ASSERT() recently with a hidden device. FTAOD I think
> > this means that the list addition will need to move up (and then
> > would need undoing on the error path(s)).
> 
> Agree, I just need to make sure that calling iommu_add_device is not
> impacted by this. It is probably not but a confirmation would be good.

LGTM. I've been looking but I don't think there's a need to do
iommu_add_device before the call to vpci_add_handlers, so the proposed
solution is fine.

Thanks, Roger.

