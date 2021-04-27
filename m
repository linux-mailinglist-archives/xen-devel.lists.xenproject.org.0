Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CBA36C744
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118538.224715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbO5y-0000yL-KQ; Tue, 27 Apr 2021 13:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118538.224715; Tue, 27 Apr 2021 13:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbO5y-0000xw-H9; Tue, 27 Apr 2021 13:49:46 +0000
Received: by outflank-mailman (input) for mailman id 118538;
 Tue, 27 Apr 2021 13:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbO5x-0000xr-3v
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:49:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e22a430-b5ea-427f-b2f2-7b201dccc6eb;
 Tue, 27 Apr 2021 13:49:43 +0000 (UTC)
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
X-Inumbo-ID: 1e22a430-b5ea-427f-b2f2-7b201dccc6eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619531383;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=myd1toTVqBSZ/mDSJU313TzT1RmUg/niLq4KzAKmSV8=;
  b=ZUo3K5IIVEDJzW1Kue3DxXTDYg7/tS+vyMKkWBPf9OSiVk3ECBRBqKSC
   9urWbHoDM5GKw8iXBBNxxFQCnOHcfeY2FxBxGKFLtIcv2uxFgK1xdvLT+
   W5LXcG9dwaHYZl4CRFbEI3BVXAEWn7fNw+GHEQqQW+6EkIX7h/XXsgvxt
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vYiV2VBx7Lot6df5TsSArbAITVBuqz3OmY4JLWQZ+RX/X/gm/UYsVFoq6BsOVPXODs0bxKYdAS
 TLG6o/T2FENnAOMxhBrGjoKueBTDZrvotzdm9T/PZEmVcmyD1VH4tYK7ZIJCEseS8jDYiNxK7K
 EoGce7lg/aXjVCZYs8/FNYvpu07pSYRz6bjC9WDc6mrhqsAPjuGxjlE6YqoxgulhAe2fn87/J0
 WxDkX/ot8QJmE+kFuhWzO1e94hfxYeiaVXpEel80KHAdn9Rc/Gs6izE5QK0VQNfOBIvX7sya+m
 MC8=
X-SBRS: 5.1
X-MesageID: 42503665
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KJDiTqML2XU8R8BcT2zw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQijtRIACdD0FwWU1iDZ02CJ
 KT6qN81kWdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LV1JfRFR+E0hACFw5e2LtKyx
 m5ryXVxIWG98u6xBjVynPJ4/1t9ufJ59NfCKW3+7AoAxr2jALAXvUHZ5Sju3QPrPir+BIWlr
 D30m0dFuBSz1+UQW2vuxvq3GDboUUTwlvv00WRj3emgeGRfkNCN+N7iYhUcgTU5iMb1bkWus
 I7vBPti7NtARzNhyj77dTTPisa8nacmnY+jfUVy0VWTIp2Us4gkaUk4EhXHJ0cdRiKjrwPLe
 8GNrC/2N9ra1+AK1jWsm5zqebcJUgbL1OtR0gPvdGtyD5GnHx15Ftw/r1vol4wsL06UJVK/O
 LCL+BBk6xPVNYfaeZHCP4GWtbfMB2DfTv8dEapZXj3HqAOPHzA77bx/bUO/emvPLgF1oE7lp
 jtWE5R3FRCNX7GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDYEpGqbrin9wvRungH9
 qjMpNfBPHuaUH0H5xS4gH4U55ObVEDTcwuvMohUV7mmLOKFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqm+xXHvVhwXQRmPNdkTz8YkYKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJPr+5nL4VWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIms9WbcmZC4WufKnZEPoTrOT
 8ag24y1bO8LpSWyyxnIcmgKHimg3wao2/PaJsAhKuZ54PAdokjBpgrHIx9fD+7ViBdqEJPki
 NueQUETkjQGnfFkqO+lqEZA+nZap1bmwekIcldrFrFrkWCrcQTRn8WNgTeE/K/sEILfX55l1
 dx+6gQjP6rgjC0M1Yyh+w+LRlxcmiNOalHCw6EfY1QvbjudGhLPCG3rA3fryt2Vnvh9k0UiG
 CkCSGPY/nEDmBQvW1i3r/w/El5cXiceExMeml32LcNZ1juizJW66umd6Cz22yeZh85zuYRPC
 rsTBESLgltrurHniK9qXKnLzEL158uNuvSAPAfaLnVwGqqM5DNv7oBBeVo8JFsM83OvucHXf
 mEQRKcKCr1BooSqlWoj0dgHBMxhGgvkPvu1hGg0XOx22QnB+HOZHthXLMWLrinniHZbsfN9K
 88q907veG9aDqsLvGHzLzadD5FJFf4p3WsQ+QhtJBTuuYTudJIbu7meAqN8EsC+hM0aPrQvg
 c5Zo9Q5bjaII9hf8AIYUtijxEUveXKCHFuixD8B+81QEokgHDaNe6Y+ragk8taPmSx4C/LfW
 SF+yJT//35TzKO+L4TBaU3O3lXYiEHmQJf1dLHU43bEwOxce5fuHK8L3+mabdYIZL1VIk4n1
 Jf49uSmfWQeDe98AfMvSFjKqYL12q8W8u9DEatHuFPmubKdWiks++P4MSpii3wRib+Q0MEhZ
 ddfUhVV/99sFAZ/cUK+xn3bLf2rEIjm0Zf5j8itmeF4PnZ3E7rWWdcMQPYhZ1KWyJ0KXbgt7
 WczdSl
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42503665"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kftpUsl9ahP770wUgFRuWwpNgPC+56o2XxJdQcTGHGrttwoOg6GV4s/+heapQAT8fS4aeSITOXBNeA+qAP8hmGjBnopDUQCBGJz6EJTGAs54zo28ewDxFzhtsVrINR/nQt4r4VmT9om1SH3cwElNPng0Vn6AGzFHkd0CP11QALCZyXwJ5+2lKALfM9JXnAcdM2uNL/hfczSZTzKcKHPOX/c8cD4TCNfzoEwyVwauGacKdICCkOyjNeHDrLcY4QXYdeEL77qUeR670IoekO4GXJstdEJBgAq5fZUo0neikOsF6kz1fIf8YXtCkjAlbE+n0EHhyfbSQNf19JcAOX4QRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwtXDBCQ26b6RTnXMLuKc9pHWYZut9qbFGnhyFz+F5I=;
 b=jNrCAS8lw4oqq4UIspTGfcrA48V9Q1TVNyo8vd3qd5y5/jWX0I2HWrKD4E2tthB/Bf28v6XIO/B6Tt9acve9xaeEVjzatUqQ1R0GSux8ysL+m2jbxqVnbuhfaPQ92wZhcFvcCqad5aCp+vIr3PKbZhyvi+kw1MKDNIfSl5ZZWZk4pUJWoQ+s2VRqhH6k4wAoUPK4vo/lMQwlfncI3WPSmFKEFzB96Z+hGB8uH6HJBcRRiKcw1oGNkJU4WhlB7ICbJY/P/1lH2hk2vXZ89gC3qk9HvJ7JRGJB2jjD6EtMFzJoMXvX7xpFYnNgVtTTUL9JNU4yGlcM7NioPp90OghaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwtXDBCQ26b6RTnXMLuKc9pHWYZut9qbFGnhyFz+F5I=;
 b=dE0E3yB3JkJRj9EZLmLGJeitWH8inMR8xuIE4yU+A3A/vELlHph3/kZ6Zvle8dbk84jPGr+xIuQ3RM56A/XfZnvn9jklw7HL1OwbBV94n/OpW1tIbU/eNG+vDU9hwXUsV+4vlUt8oHxCITV2wZXa4joGDalE2muIZviRjCYw2r4=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <7e3f69d7-23e8-397d-72b6-8c489d80ea45@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 7/7] video/vesa: adjust (not just) command line option
 handling
Message-ID: <3e04b606-4e4f-e181-d3be-bcf99a2c8fa2@citrix.com>
Date: Tue, 27 Apr 2021 14:49:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7e3f69d7-23e8-397d-72b6-8c489d80ea45@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94f8cd40-142f-48d6-0cfb-08d9098340f9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB48716FF1ED7DE4E52732E715BA419@BYAPR03MB4871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kfilim/Fzurdi67iT1rnQ5KmmZFt7Kj0DqyWeU3SEV8xJZAGX+wtnmjpB3jK4Eop0yoLxTVeEA6cLz9NNxhT+rHp04AVUlqu+dQXKtjt1CgyNdr4cpFnHRTT3gMpD2xM+WNruR8Ic59WiPhRbQw9Tf6xRjANEE1C+oGIminTQ6jshc0Yr+Pd+lckoRRIW8VgcHhKF1tVoZxUEkdGw/dLSiESQR8FNHPdk2zfsVOj3g9KkHj9uNY0SnEGoEbAxyzmWZU9+NmwJ1mupuvK6ySaLYBYuWebdEzF6yTYTkbHACh57Pbw0jBTFIT/8D3B0BVuDVzjOLsEV4Xjg1iAdo7upFAoPEoLVAqBCfTQJvalsiBipWVP98qvj2xnIRvGXqgZzq0oMqa74eA+L3p/6vKrBcxR7hSOCpxEMkdCYI09GldvZRSj48O3eoq/DiTzaFRQLveob66SeurcaBRSfYpxEHNM0PXiW+KEG4IXWcRSYapbghHi3CqpiaM/CFFaPGwm/xlAZEaKweM6lexT/F5Z5U5hYsIsFMZdxNuEJ3ZQumcAmOp47EwFOQIM8Es4+EkckIolJbKlH2fsbMQ9O7iTvT2xb8ZOlCH43RfmUe0pjh5HBNoUUSYrBx63MNQFXzanq7pQ1ccoePzi/DzMTMP1/t9zepno3BCfFaRxjax+K3BVH3XitS45D7FUVIpDHQfY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(66476007)(16576012)(8676002)(31686004)(316002)(5660300002)(66556008)(66946007)(2906002)(54906003)(4326008)(86362001)(186003)(107886003)(38100700002)(8936002)(36756003)(16526019)(6666004)(2616005)(26005)(956004)(31696002)(53546011)(110136005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHFsdHdRN2hFaG5SY3NHeTVlYlhRcStRWDh0Nyt6Rm1aSGNyY0M5UEJYS0xL?=
 =?utf-8?B?MXpwQ2Jjay9sbTJJUlRleGFXUGR1K2VVdHJidGZtUkZsUXNURkZKUTkwT2VN?=
 =?utf-8?B?d0c1bDR3V1oyL2pjbkZUU2IyOFZFT05GbVAyOFBNb0N4b3RYcmpKa2pBVXlN?=
 =?utf-8?B?Ym5MdHBObXdudHQ2WWJ0REU1dVBFNnl1RmZaYmtzem1aVnd1V0UzRVNqWWVN?=
 =?utf-8?B?a002WjlDWGR6V1IwUHljOWs2MkF3S1k2TDVJNHhVSVNMb2xPNWV6d1JhcHhI?=
 =?utf-8?B?R3d0dEhIK1h4K2hmVVU5Z3hkTlQxemMwdStVZlN5ZzA2dE1BRGx2MkNxNXJG?=
 =?utf-8?B?TENLcytuQ1BDaE5GREgydmgyV2NTQ045OFp2eDllZTZhTmxHbU91UHhXY1li?=
 =?utf-8?B?KzJUR2Z3TVExRW50UDhJZ2N1R1F5Nk9VaTJHOXBPKzJFWS9qU1ovaldsQ0xY?=
 =?utf-8?B?NGlUK0oxSkp4K0RlNHZKaDlKQ2FVOXQ4V3RoK3lUNkxDb29la0l0MFBRY1ZH?=
 =?utf-8?B?aU5LUUlQV1V6K09XL0F6T0tjTDZJRUpUOHMzVnp5R2FaVVgwSDBUOENOL2ha?=
 =?utf-8?B?TDlKc0NSSjl5bWFka0p1aHZ4WXFMNFMzU0taR0djVGJHUWlYbnJ4ZU1yZGRN?=
 =?utf-8?B?ejcxTUJ1ZkV5TEo1dTBNMkdRVlBEOGNhbzdyODhlaHVPb1JDaU1DNEtSWVVj?=
 =?utf-8?B?ZzZ0U09IWmFsQjMyR3JwdFVrcE12L2RQNFBHWnNYTDIwamxMbCs3WEVNRmtt?=
 =?utf-8?B?bjRJaHJXNVZjYkRPcUM3QStUSVdHZUNLZzFFVDRLNi9hMUFVTmlrUUlra1dp?=
 =?utf-8?B?Q2ZRYWxDNFBrY0N1dEpvQUFwWUhUOUJnNEpCR3REWFhXd2k0L0FqMFc1bnVD?=
 =?utf-8?B?YStFNjVmNGl0SER0N0pZOXBEbE5lWTB4eVFjRlRsbVRIblFzNDgyak5aaGE5?=
 =?utf-8?B?QjVtZTRDQXkxQXhMRjdsNXlZRzNYeUR4TDZhUUh0KzE0ZmZOeHlnKzdUSUhD?=
 =?utf-8?B?bmFvdXFGWjdYOVY3Z0EycGJ5cmxZdys1ZG12dk1uakJYY2M1OTVLN2pQU1Rt?=
 =?utf-8?B?YzNvQXZpOTVabWpqS2JOOGxGN29GY0pMTjRmZ2NDcm9sMUxlU2R5d2VkYjRz?=
 =?utf-8?B?N0hhOTBXeG13UmZBbjZMWEVKNld4U1gvM0ZmTlVvZGxZK2ljRVd2dlFYR0xw?=
 =?utf-8?B?QnhQbEpOUE1GMkxOQThQeFQyUkNaeEpCVzZseGJLb0ovRzNLUTVuSDZXaER3?=
 =?utf-8?B?SG1pZlV3dzl3TWtJSk9YS0dLQ1BIbWVUbHZIWkp3SUkzcXNLWWZMVy9UUDl3?=
 =?utf-8?B?VzVZMG9pOHdtWHVHekRualE1RE9lTGpKY0EydkZJd0ZnSGpybXBJMkRMNmk4?=
 =?utf-8?B?NXp2YkxVcnRWeWNzaTB6OEdDNHR2c095ODk2RFQxSEdwWW9ZaENkUjZRSngz?=
 =?utf-8?B?anZ2Yk9VcldmOFByU3hSZkx5bTN0SWZUd0pnMTIxVmNXdHl4aldSNjdlZkxy?=
 =?utf-8?B?N0d2dGd0VUtyOExJNVRya2lSSmF4cHRQNTBBcG5ianpUaE9iSng5ajBybWRw?=
 =?utf-8?B?cjFKZnhWLzRBT05qOVlyOEw4U1Q5VXZtNUZWaXI5cWZBaFVuV3lSQWtLdmkv?=
 =?utf-8?B?SHhlNFNtRWdnWDdaMHllZG9pRkxFKzBudk1TQ0thK05jZytxR3ZnekE5NlMz?=
 =?utf-8?B?S3JPZi9MQWd1M3dTMllRbjkxU1hjdGY1d21FRjcxOEZTRUpaQWovTjFkc1Ax?=
 =?utf-8?Q?ni8bGRQtuJaB3RNmCDXRBYNffXnemkSmukU1KBS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f8cd40-142f-48d6-0cfb-08d9098340f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 13:49:18.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPZeonURZwYsZe1ESqAjJXTGGvc/golBuv4vKwiHM5anskO9kKpfRaI5TS/L34irmotHgx/NZIGz4dQM1Y0M5XfAmy4Od+IMeh7bQ82ZVQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
X-OriginatorOrg: citrix.com

On 27/04/2021 13:56, Jan Beulich wrote:

The grammar in the subject is very awkward.=C2=A0 The (not just) like that =
is
weird.

If it were me, I'd phrase this as "minor adjustments to command line
handling".

> Document both options. Add section annotations to both variables holding
> the parsed values as well as a few adjacent ones. Adjust the types of
> font_height and vga_compat.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

In principle, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, with
one note below.

However, is there really any value in these options?=C2=A0 I can't see a ca=
se
where their use will result in a less broken system.

>
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2369,9 +2369,21 @@ cache-warming. 1ms (1000) has been measu
>  ### vesa-map
>  > `=3D <integer>`
> =20
> +> Default: `0`
> +
> +Specify, in MiB, the portion of video RAM to actually remap.  This will =
be
> +honored only when large enough to cover the space needed for the chosen =
video
> +mode, and only when less than a non-zero value possibly specified throug=
h
> +'vesa-ram'.

"and only when less than a non-zero value possibly specified" is
confusing to follow.

What I think you mean is that vesa-map will be honoured when it is >=3D
chosen video mode, and <=3D vesa-ram?

~Andrew

> +
>  ### vesa-ram
>  > `=3D <integer>`
> =20
> +> Default: `0`
> +
> +This allows to override the amount of video RAM, in MiB, determined to b=
e
> +present.
> +
>  ### vga
>  > `=3D ( ask | current | text-80x<rows> | gfx-<width>x<height>x<depth> |=
 mode-<mode> )[,keep]`
> =20
> --- a/xen/drivers/video/vesa.c
> +++ b/xen/drivers/video/vesa.c
> @@ -19,17 +19,17 @@
> =20
>  static void lfb_flush(void);
> =20
> -static unsigned char *lfb;
> -static const struct font_desc *font;
> -static bool_t vga_compat;
> +static unsigned char *__read_mostly lfb;
> +static const struct font_desc *__initdata font;
> +static bool __initdata vga_compat;
> =20
> -static unsigned int vram_total;
> +static unsigned int __initdata vram_total;
>  integer_param("vesa-ram", vram_total);
> =20
> -static unsigned int vram_remap;
> +static unsigned int __initdata vram_remap;
>  integer_param("vesa-map", vram_remap);
> =20
> -static int font_height;
> +static unsigned int __initdata font_height;
>  static int __init parse_font_height(const char *s)
>  {
>      if ( simple_strtoul(s, &s, 10) =3D=3D 8 && (*s++ =3D=3D 'x') )
>



