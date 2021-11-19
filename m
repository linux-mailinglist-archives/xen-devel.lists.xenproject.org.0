Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CB456B30
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 09:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227650.393790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnyoO-0000iG-Qv; Fri, 19 Nov 2021 07:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227650.393790; Fri, 19 Nov 2021 07:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnyoO-0000gR-ML; Fri, 19 Nov 2021 07:59:56 +0000
Received: by outflank-mailman (input) for mailman id 227650;
 Fri, 19 Nov 2021 07:59:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r4T=QG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnyoM-0000gD-HC
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 07:59:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac262b1e-490e-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 08:59:52 +0100 (CET)
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
X-Inumbo-ID: ac262b1e-490e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637308792;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pTtrypl90DsDq5pe8TgWhmGYbYrvVJA5PR2TSYv1OfU=;
  b=LZ8JDYvExGsm4ZYRX+DWizdK3+Cu7J4jbcujNy4hEmNBYmDzVq5cnakp
   zxKZVTp/4pT85WcSLTLgpPwVhFH3ktJRsvEH7jGWE1wfNgqDN0jE6q+G7
   qAepfqcLLSOubQ5jQJqa74B5bWRApvKqgQd3Hagwx0iVqvjhA8ahxJju8
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NgFFt/xYt2HbMjeYF3CiqIMqBkpkd5+H9qv/9bayrTRNSUlXJt2CNqDA5zk37yBkCakndVdZ2j
 5w0DUn/b/qguxwBTa43yOGKaoIvtDo5th96sxT0AyeRb2Syq7vAN5qTHVXN4GTw5nTGGZcoOwq
 FshkDQKfiImfOKEtlf5WzcCysyNfqX0mXfvWqKRSmZAHvN+pbmKbK0OT0J6nAV6QTojUq1og1g
 sOH3RL5JjxYhraIntD4kspau47AmYxPlkitxL1Ji49z2sngxTZ49R2v3OnOS6/H/fCA45vqome
 BTfBvlIk9Kz734wc3ei+dtOh
X-SBRS: 5.1
X-MesageID: 58218831
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 VUIeA==
IronPort-HdrOrdr: A9a23:aUGelqOPwPmN0cBcT1L155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY55as854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nIvhSQRI+Lp/+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNwN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wmJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABOnhkjizyxSKeGXLzAO9k/seDlEhiXV6UkWoJlB9Tpb+CRF9U1wsq7USPF/lq
 z52+pT5ehzp/QtHNdA7dE6MIKK41z2MGDx2V2pUCDa/YE8SjjwQs3MkfgIDN/DQu1/8HJ1ou
 WYbG9l
X-IronPort-AV: E=Sophos;i="5.87,246,1631592000"; 
   d="scan'208";a="58218831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiBl/5MhdIB66FXUfRcvxq3m7Xj0Mpj4y468PtnQs9IpWpbhLXGZsog0qXudlCnuqhmmrWVfjYydkWJpHDMA5IUFa4rgaWscKfEW3WhthPfvg45qw+ez8xvL+AtTtKUs9eZyA44d2p0IIJ/tTRRxj0hx67EOOsdbZIrnAB9fkOrnLzg6/1asmWJfVYzT6nOjZXgEur1HxJVlwTUnL7WP2iNNck8m2nmXuhcDCGzWbMzTAa2DJDodgw/20vbR7baN8nC1oTsbd86LfeEcfBFgiYdTApXzmauGSqbLC1wPWIR/wStnOOItHbnQRe8qDvndu1K7FunMPVdspQ5uH3QOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STQvdXtUWHGGlzcqqpb6ApyoyLMpnfYNh8VgaY2BInI=;
 b=DS1Wt42XmqXMD/w7rv2ZUNwUlFhRIPpS+b/FzLki57WB0kadt6PqwAtEfnEtBSjQvfkC/8Vxj3I+8mo5/AzR67gguQPxjqrqgjS2oMWqOvCk4FlAoEse788XprvOqblmL02taYZAxkTKlKL2tIz0K3Z9MoAF/E5hA/qeSDQ8wHZDLIj4RXFxHv5gpuLaz2q8aSWGxT9PkZw1gn8Tm+E2wXx1qSxqHha5WLCEDVbZJ2MV+bKHrrUx9OXBK17lJEfmzQ9+BP/EK6SNbIK6JoKMWYonjwdK8D21WVYrUqonPJoSKrew4WxOMBqQWD03Z6ae5/n/KcPIycsiiFkPDDTpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STQvdXtUWHGGlzcqqpb6ApyoyLMpnfYNh8VgaY2BInI=;
 b=c+IKvSVheLe+p0vQi5oIMUUjYmWZbTi/XQ1LOgfBfDK+//M7rJiWT+Sv8hFeM0SEZLXWzkVlFfCXWeSnUiJSjh/0kYABsJ2X+kbosgrvcOKrTpRHl12TxkipNxnlUkMKFbeZRayytEYzcH0SQ8tf3+1elHVtxC2eOdeD8Q23KSA=
Date: Fri, 19 Nov 2021 08:59:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	"Christian Lindig" <christian.lindig@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, "Doug
 Goldstein" <cardoe@cardoe.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, "Julien
 Grall" <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Meng Xu" <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>,
	"Paul Durrant" <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh
	<rahul.singh@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Samuel
 Thibault" <samuel.thibault@ens-lyon.org>, Shriram Rajagopalan
	<rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, "Stewart
 Hildebrand" <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Message-ID: <YZdZZsgXjZv/rh66@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
 <YZaOgGWfbDkIq4Lq@Air-de-Roger>
 <d4f3d50d-9875-f7bf-2c82-83f8fedb8cfc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4f3d50d-9875-f7bf-2c82-83f8fedb8cfc@gmail.com>
X-ClientProxiedBy: MR2P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcca3481-da7a-4d64-5dae-08d9ab3289e3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB2491220BF8D505E4AB9621C68F9C9@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDrfy9Ai8xsHhnJ0LMpl/PdVxAAoP1jdRohRDR00IYUWHyh7Tzq+lmYcQeGmzubwtgwL8ArAYOIXxvhKp5P417j7AZL9GOyoideDcL+0BXm6xWx+1BHCLwbep42t2H0xnXJ9Mtb/psvWn9gnXnBT+fjhvgO/PS42ZZN/W1B3/4FKGmV4hPcrzeDFThTX4Z51sWntRxau1Au4J9ph2sMIRPhMWykZBXOyqnmRj78EZEQvCuzG90dLzwgCtw7sDeiNZaeB9LSE5TY+okjNQYSAJ6P3mTz/E6oxJ8elInQCCMZ7BbUuPwhyQWw7Ax7/dAltWF3sP5JziPYn5kUKTkQzL9Vecehvv/fKTHn2jv7b//Hjp9b4fXrOvWjluIwJ0CyScX0OEnJyh+8P9JQUImXMU6O7M+Ke6iLQ13URj0QxOZjs0+6kckJRIvrPu0Iw7/eCnfJf5YB6zvHsdNbo56Koba2wRfXBNDFeJXIuujmAhNeqcnnhcv0vqDwh9sA02EcMvc8ZKRm1p4Vp0LP5pKHu6lY3/Zwr1t+7UNZGaj9D69eEKxpcAloZzrNmNXzjNQY1LJsnGkLTPz/aW0NDc3AZT9RF30O4FxjZIhmfDxHha8ttpFxnHObaXAQIFgi2R0j4HtV5FdDgoIgp97IZeIH5Clf+F+Iu6FtksFjRysSFbg75FKweGM2eQlWdUBrmLYhMngGFx8DglxmaT6bn81c37xZ/OPSwUFFdXhQvdagdksyTvqw4PGaAFDey+AkipPyeYs4QRVyZw7RDQ2kwx8/oTpzO+JInAi46e5XE23mktPX+ZNF4wEvpIe6MJTCJL4zcg7wROHavlSsPPSI5Hevv2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(956004)(186003)(86362001)(6486002)(26005)(83380400001)(66946007)(4326008)(6496006)(966005)(2906002)(82960400001)(33716001)(85182001)(38100700002)(9686003)(5660300002)(66556008)(7406005)(8936002)(66476007)(8676002)(54906003)(7416002)(6666004)(6916009)(53546011)(316002)(508600001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhxSzFFcklVZjZ2QlVMRzl6bGJDb2t6M3R6dWZQZ1prWFZ6c3ZaZXNpblV6?=
 =?utf-8?B?NzNyZFZrMUNzT1l2WG0yV0UzZFZnWFJCaU9MRGF6aXdtVW5zc3U0b2pyY216?=
 =?utf-8?B?dEZKWjdzVUROdkVibDB4YTEvRTQ3anByMmxxM0orMXpQY2JpQldFU2djRkVm?=
 =?utf-8?B?RGNBOUpUb1ZTeXcvM2NRSi9OVS9OOU4yaXBkY2l2VEh0SVBVbEdSVndzQU41?=
 =?utf-8?B?eE1BZWxwVVlwTGY4WTRGU0ZKQVJWQlROY1dxZS8wOFlpSFU1c1NRZWtRUkdj?=
 =?utf-8?B?Z2l3TVlCQ1dSckFFV25KR2l0UVozR1krQ05VWmEwNG5GZ05qSW9ZSmZGeFM5?=
 =?utf-8?B?N2ZWZUh4eWZEQnRpS1M2MVVaU3BSc1NGZW44cmRDbFJuNlFRRkhJd2hWZ2kz?=
 =?utf-8?B?dHVTSmdheXlIN3hnYlJSak85NWduamZFRTVyN3cwdWJIUFlEMHo3NTdkRThC?=
 =?utf-8?B?WTYyQkdCRnlIdXkveHkySnIvbVZWVS95N2tBREprZG5YbFU2T2ZlZUpSaHVl?=
 =?utf-8?B?bGhkdEF2OTg5ZTY1ZFNJc2hUZkVqMDFaZ2V6UndQNnlPWmk4T1dkYkQ3TTZS?=
 =?utf-8?B?M1puTmF3UkdGUkxzNGdiUkFPY0tvMUI4SlQyT1A3cnN0Mnh4U2ZET2xEMXVa?=
 =?utf-8?B?TGlRTlZ5eFRuL2ZxVStFd1dIelNqc0VaRUlzbncwZEN2cHJ2ZHFVeTI3aGdS?=
 =?utf-8?B?Wm9XR09EbVZFL0tUUU5xcjRocjRtSmliQTJubFFlQ2FIVjVIMlFwdHZyYUhW?=
 =?utf-8?B?ZUh5SC92R2NLNXJqT0tDaEc3TGp6YjNFSzJzb05HN0hxZkRvdGFHcG5na3RY?=
 =?utf-8?B?UWxBOEEyOU5zSTg3QTQ4TFk5K21IcVI4Q3diLzVTRmhmNjNvSGx4QVJTV0kz?=
 =?utf-8?B?UHlJaTU5anNPYVhacjZCTlZUa0ZvUG5MNnFQMEswT1hzM0dIbE50dUNDY3Bx?=
 =?utf-8?B?Q1hxbTd4OVhpd0YyNDBTMmdQWGdiTzc2RnRJTWs3TWRxUkRGT1h6dC91VXA5?=
 =?utf-8?B?bEtybG9uK0haemNITWoybDBub1BsMXZWUVVDd1Z4OWxvVzR2K0lXRFhMbjUw?=
 =?utf-8?B?cXA5bW9FYUlScU52YUc3UzdjMEhpVnBBTVYxa1hvMnozN3Mxb0V1RzZYUEZa?=
 =?utf-8?B?MGlUbVcyajZ1U3JGdW0yMWlLY2lTcjBOV1JMOCtKL2RJOFlFcUtNaVRrV2xo?=
 =?utf-8?B?dVR4ZWlqME83TDcrZ2t1cXJWeGIwOHQ1VU9GUGt2SkNoK2JsOTZuamJJbU5i?=
 =?utf-8?B?SXk2cFZLOXdLK3lQMGExM1l5ZDJpNG9lRlMwNHlaQ0t6WGk4cHJlOWtsbWRJ?=
 =?utf-8?B?TGhla0VSakNrdENpaVNhSVY4V1FvOHpGSHV2aEp0M3Q3MVZ3L1JOeEpJTFJj?=
 =?utf-8?B?bnN0THVlMjUxWnk0M3Zma28xdVRQMjdaUG5BVE8xWGJMbC95VFB5aVgyODU5?=
 =?utf-8?B?VWwrMy82QjVoZEVueVUzZmJnVEFZTnVSRjIvajlteEZVQk83WE4zaXhSMzNm?=
 =?utf-8?B?dXRvcyt6aUFwQ1JjUHdUbDZCYTJWNE5ndHZOMmJ2YVJsbUJhc2hNZVN6YlF3?=
 =?utf-8?B?eDJ3T0dTVFR2b1hCQ05FV1NsMXRwd2g3UnNKVnFTd1BBdWJyRGRGN1lhWjhr?=
 =?utf-8?B?NThtOFJTbFdncHFadFdoZGxSOHhReW5VZjFnMG1EWHZIZ0ZocUlCajlmNlhm?=
 =?utf-8?B?VWVXTTgyR2srNW1EQllKckZVRjRqOFp4dGl0ZVpucGQ5d3Nhb2xoSm00YjZG?=
 =?utf-8?B?djRTY1JvaHBqVnRzQVNMQXZrYnhrODhRYmh6QmpYL3k0WEF5cU92dDM1YWlk?=
 =?utf-8?B?MlRaVXVZTnJDR3lQVkZDMmhKeUxYRktnU2Jyd0kyQXkweEV5RGg4cjRTdGR0?=
 =?utf-8?B?U0pSNEEydmtpNWgrdGhOZkYyT0ZGamh0U0ZTR3g1a3hhOThsMGUyOU1uZ3Vi?=
 =?utf-8?B?U2JkWG8rYTFkc2hHUUl1Wit6ZTVSancydDdJY3RoMGh2cUNWNnVmQkIxWkxo?=
 =?utf-8?B?SVoxUjhUTk9rMEpYMnZ6VVBLUzlvdnVzYzB0T1ZGb3oydEZxd01SZzNYa2tH?=
 =?utf-8?B?YUZWYTFZMDE5d0lSUkNGblRqZG9hR1h3UlRkUitwL1pPNFNRQ3BFb1JrRk5Q?=
 =?utf-8?B?Rk9qYmpBVkx4aHVYcTFmWGZiVTNVYVA4K01teWdybGdiUWxCZVE3UzJ1VFBs?=
 =?utf-8?Q?2try/7aOkNf0oM0ae3sQY7A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcca3481-da7a-4d64-5dae-08d9ab3289e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 07:59:40.4777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiYQsWJi02o0JvmUs7mNXsqf5wXQS/XXo9e+rMSWXxeNuuZG7PGGwNiiwVuufVYTsKQ/di3Mhb+hj4Dc7Ppd5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Thu, Nov 18, 2021 at 09:04:30PM +0200, Oleksandr wrote:
> 
> On 18.11.21 19:33, Roger Pau Monné wrote:
> 
> Hi Roger
> 
> 
> > On Thu, Nov 18, 2021 at 06:11:07PM +0200, Oleksandr Tyshchenko wrote:
> > > On Wed, Nov 17, 2021 at 11:54 AM Roger Pau Monne <roger.pau@citrix.com>
> > > wrote:
> > > 
> > > Hi Roger, all
> > > 
> > > [Sorry for the possible format issues]
> > > 
> > > Document some of the relevant changes during the 4.16 release cycle,
> > > > likely more entries are missing.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > >   CHANGELOG.md | 11 +++++++++++
> > > >   1 file changed, 11 insertions(+)
> > > > 
> > > > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > > > index ad1a8c2bc2..8b0bdd9cf0 100644
> > > > --- a/CHANGELOG.md
> > > > +++ b/CHANGELOG.md
> > > > @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](
> > > > https://keepachangelog.com/en/1.0.0/)
> > > >    - qemu-traditional based device models (both, qemu-traditional and
> > > > ioemu-stubdom) will
> > > >      no longer be built per default. In order to be able to use those,
> > > > configure needs to
> > > >      be called with "--enable-qemu-traditional" as parameter.
> > > > + - Fixes for credit2 scheduler stability in corner case conditions.
> > > > + - Ongoing improvements in the hypervisor build system.
> > > > + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> > > > + - 32bit PV guests only supported in shim mode.
> > > > + - Improved PVH dom0 debug key handling.
> > > > + - Fix booting on some Intel systems without a PIT (i8254).
> > > > 
> > > I would add "Various fixes for OP-TEE mediator (Arm)" here and ...
> > > 
> > > 
> > > 
> > > > +
> > > > +### Added
> > > > + - 32bit Arm builds to the automated tests.
> > > > + - New x86 pagetable APIs.
> > > > + - Arm vPMU support.
> > > > 
> > > "Extended regions support, device tree only (Arm)" here.
> > > 
> > > ...
> > > The extended regions are ranges of unused address space exposed to domains
> > > as
> > > "safe to use" for special memory mappings.
> > I've worded this as:
> > 
> > "Report unpopulated memory regions safe to use for foreign mappings,
> > Arm and device tree only."
> > 
> > As "extended regions" was IMO too vague. Let me know if that's OK.
> 
> I think, it is OK. Nit: maybe replace "foreign" with "foreign/grant"? I
> would be OK either way.

Maybe, I would consider grants as foreign mappings also, ie: the
memory is foreign to the domain, but I can see this being confusing as
we have a specific kind of mappings that are named foreign.

Does replacing foreign with external seem better?

Thanks, Roger.

