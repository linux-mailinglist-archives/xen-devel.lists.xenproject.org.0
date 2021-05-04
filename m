Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A965372E86
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122616.231276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyaE-0002CF-4C; Tue, 04 May 2021 17:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122616.231276; Tue, 04 May 2021 17:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyaE-0002Bq-06; Tue, 04 May 2021 17:11:42 +0000
Received: by outflank-mailman (input) for mailman id 122616;
 Tue, 04 May 2021 17:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldyaC-0002Bl-Ns
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:11:40 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fcef880-6c1b-475f-9abe-a2e657fb6501;
 Tue, 04 May 2021 17:11:39 +0000 (UTC)
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
X-Inumbo-ID: 2fcef880-6c1b-475f-9abe-a2e657fb6501
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620148299;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qzpfVoL1vNzteEAkCE/Nulz//M/e6jSjpz/5Xp5sM70=;
  b=F2XWMcfmECFwTI8qsnfqX/fmfVHwruLmxvUT30LI9jBFB3hBti1vuZSk
   JR9U57sCUCtKJEcqOwJ/DgHyyCzVUDoP5FzHX5Gsw64ijA3N4elPakDIM
   YP0YaWrHJT6R70qEtQjx64huW2vFnlctQJ+j18Yqogim3q6apP5+Gvac3
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LbS+GgXo8jgueGmJhyPP4B9h1B7obDHe6U9a+uebv6fG0cy26A8iFVRz3W5xVqoHeXE56B6aSG
 deCiAoJmqGG8nqrCm6MHaMVe067uU8amI8euVzulE4BU5VptbTqzBV9aDoAyUP932tPlAcZtlF
 jIpHPPM/i+D5qMcyTgVUapR9vGO+dMv+eD5dcnV/6VAo1WQaPTR/sEM1dPtgz1Y8sSZKBVncfs
 csQ/7xvkeC05eQhN6bRo75ndW2OcvTz/ClOkDUyjiyUs3ftW7waoNZ8Fwi9Oxp/j5L1Rt17T0V
 01U=
X-SBRS: 5.1
X-MesageID: 43059945
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BoYpvaiwD7xcXBnYT9Q+eZL973BQX3Vw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIDVuL5w/CZ
 aa+45jrz2vZXwYYq2Adwc4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZgbxpkx7A+/W
 /Z1zHo/6nLiYDG9jbw9U/2q65Xltzo18dZCKW36/Q9Bz3whm+TFf9ccpKYujRdmpDI1H8Ll5
 32rw4kL4BP7RrqDxyIiD/M/yWl7zo08X/lzjaj8AneiOj0XigzBcYEpa8xSGqg12MasNtx0L
 1G0gui3vI9Z36w/1Welqz1fipnmUaurX0pnfR7tQ05baIkZKJMtotaxUtJEf47bVHHwbo6G+
 pjBty03ocuTXqmaRnizwxS6eC3Um92NhmLRVVqgL3u7xFm2Fp9z0ce2fUFmGYB+J8XW/B/lp
 T5G5Utu7dUQsAMa6VhQM8HXMusE2TIBSnBKWSIPD3cZe86EkOIj6SyzKQ+5emsdpBN5JwumK
 7ZWFcdkWIpYUrhBeCHwZUjyGGNfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y8590CH8zyQZ
 +ISdBrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/Lit7XK7ftqvfQfJ/oVfnQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oVVf4+b52DajG78kewIUALeR3w0wooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNz2gBAGsbMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjt2T8bcFh
 9jt016kJjHaaC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9ceAos5XrdyUSHGDQZ8lwoviG
 orUn5FembvUhfVzYm1hp0dA+/SM/Nmhh2wHMJSoXXD8WOGpc8uQXMfdyW0UdGehDsvQzY8vC
 w1z4YvxJ673Rq/I2o2h+o1dHdWbn6MPb5ABAOZILlPlqvTYwF2R2eSjTm8gxU+E1Carnk6ty
 jEF2m5aPvLCl1StjR93rzx+F15TGmbYnl9c2t3q4F7CGTAtEtiyOPjXNvH70KhLn85hs0NOj
 DMZjUfZjljwN26zza5sjePH3dO/ORiAsXtSJAYN53D0HKkL4OF0ZwcF/hP5ZB/KZTFqekQS9
 +SfAeTMRL1A+4kwBauu34gISV4wUNUyc/A6VnA1iyVzXQ/Cf3dLBBaXLkdOcib9HWhaPCS0p
 l15OhF9deYAyHUUJqhxq7WZTIYdU+Wjm6yUu0yqZdb+Yg1r6B+GpHHUT3OkFFLtS9OWvvcpQ
 c7euBc5ruEB6pEO+o1UAhd9kAylNuOIFAw2zaGSNMWTBUItTvjI9iN47D0srIhDU2KmRvoNT
 Ckglpg1saAexHG6KUTBK0xK1lHcUQQ6Hxt++WZao3bYT/aPt1rzR6fMnWndqVaR7XAMbIMrg
 xi69XgpZ7aSwPInCTRtyB8OKRA7iKORt6zGhuFHapt/8ahMVqBxous78jbtka5dRKLL2AZj5
 ZCb0oec4BqjSQjlpQ+1myKcZPMy3hV2Gd20HVAjV7i2o+v/WfdEwVnCGTi8+RrdAgWFGOJg8
 TD+fWfz1Ln7lF+qML+KHs=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43059945"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0GBlWioToy/2dBD5UTa6dwF4GgnB4ilpInxXzkMP2tBTqaz5GcHYR8T10gzSLX53GSSeELDg9I4lcdDE4gJ5Jx03fAAedCVnPZLHM4H5eu3XjwhlfGASBg98ZHy0vx89rPyOHEWJDL3aoaXDe0IIS1jP3X2dmtTOTuq5Ne70pW+r/nYzouGc49ByHabbYWthodfWLtUAKZM+rw/Y/Yefb1uvTnXvjRc36n4UceDBvDshpUkncxN8mgtLfIlfDQt5LHfjUNz2aSRZL2hV7kiEQfnXQNEln6vdyGY4cwscEC3qALmtjTmnV/d3U6Q0q8IDJR2fJkMJ7wVLLf3uF0xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBVKAU/3atcB2PR5D0RKoqYfEHv+UESguO6ovrxI4s4=;
 b=AN9OayFG/21pHVg8A1Xme2oZ1JNjPLGA8MegDZ6RwXxpMKzSuDJTeFOkzjBE485bx2AsraI+U0pJVHSdrXYmVAWTlkakwYk8YxLXbY3Lsc+4Yz9Zhed0OX4+v9zujytxOUUvcJWQKDYydFQI7S56DJmomHBF3FXy3tMTy6hv9dcT8D3BvxtjsxnTo0MaX3UTCG4pkFuWmdTffvEUR4trOihJ+GiZTAaPUHQtufTlJRkMpOVT5/5iLBGhHi9c+1SnpPO9pOeIxbdmzobtIp1dJ11P78dKMtUCDtPjf2xFBf2MgnudBgJeLo8bNbctU7GQhIvWdMDJ3oTZd80NiTNdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBVKAU/3atcB2PR5D0RKoqYfEHv+UESguO6ovrxI4s4=;
 b=CA9M/n+uuLM4ngUeAJrNWWP2aITo+btzro2J71KMdO/vWGk6f+DK3GwVcn4gw0jbOjXMeA/KHHkFxZCZkSBqhM2N3wULOb5H47N3IajeAIFRBkRpht7LPUApXom5q9hIuexHOvH4L+6c3bhYlWafqV3bnHKGwEXJj/OgDbDldPw=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-4-roger.pau@citrix.com>
 <273ba6f9-dee9-00db-407b-10325d21afae@suse.com>
 <YJEoS6P1S6NbySFd@Air-de-Roger>
 <54c48a0f-075f-c379-eeb4-60b4439d8907@suse.com>
 <YJE20/M+OCER2vPn@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 03/13] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
Message-ID: <66d6596b-5d90-7bf8-a383-ce2b6b1fe03f@citrix.com>
Date: Tue, 4 May 2021 18:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJE20/M+OCER2vPn@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f63693fc-a721-44ed-2185-08d90f1faa17
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB544039F1259166A55A973CC5BA5A9@SJ0PR03MB5440.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AgNad49s9JdrB2JN3HPaoCrYmEYPYKRMFjhPSODgRgoXANeK4ASRzpjSWO4tFwaeUIcV8bd9fSxGdIQNr+ihD5R5DJ2riAEukzAJsdjugDkdG7zc2U5rbmDteYTtg92yDp/1NBR6Xwul6EvvLwY970DURZWxzJiq8/q7w8DM/uRIaEuwfiy+lV5Clis58Bomn4B9sSzqe8FqZH3+wQcLfKPYh1bK7k/VVk5SNK3prok1NjCJ97pAHGltC1Y7iMgn2jHDf9EY9BQW5JUBuwzdNd9y0vyehSn7u4dDFdpREmr6jPYpGuRL5brtw5GcQ5uJYFBvbZgN1mc3CwBNGHykUqxdXBgQy00dO+jEF40vHfNafyQMQnOCdDbZJ563PFwtWIoY28BYdugL+1g6NHUV6YjOtWC+00HpCY7ARrLrFik5+x9jVB4QI7W8dzkAKNAPaZ+cJnJqH0cRaiHICBfViSCeQRz9f3R8jVvtO0BkSuXgWZUkLRkTxypR5otWsmB+rRLk7oFFO/0FtoQCArdZsKShb4QweAt1ssES2mNjohtjJzwDVN0eayX4vfYd8cvbtdS+EKuBB5GMxKH1d2FA/B0Pc6m+JJs20pKK4LSYESmsjRBZF/lKLmP03yaHEhN2ewiU/0wi5MDBVFzHco8NgmHJuyZ7yhQKDkf4oyXr4MNDekq0aW/8HjedmGzy3CAD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(186003)(2906002)(53546011)(6666004)(38100700002)(4326008)(5660300002)(66556008)(8936002)(31686004)(6486002)(54906003)(66476007)(8676002)(478600001)(31696002)(316002)(86362001)(110136005)(2616005)(83380400001)(36756003)(956004)(16576012)(26005)(66946007)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVNETXBLVWFQRXhPVGRWSzYzcXNiQi8xWitLTGhVNWU5K0ZJS0s0STI2MU1O?=
 =?utf-8?B?K2dVMTV4dDkzSld0NnA1ZGp1YzZFcGZmNERmVm9IazZkcjdwUlE0OEIySGZW?=
 =?utf-8?B?VkcvQnNJTEd4S0hjcTVtd05zMzlrTmIza09KQnUwQ2MraFkyNWg3dEt2blR3?=
 =?utf-8?B?RjJoNWZqbjhjRUVsUlRUTjd2YXFrTDVKcG02ODJGMWZMMlUvT2JVdVp0bGdB?=
 =?utf-8?B?eEVYT0gvbzkyb0hGUUcrYlFkSWRuS292ZmxkSTNlQ1orTzJkK0Yzbk5UTUx5?=
 =?utf-8?B?ZHd3Q3c1OFplMTlROU92aGR4VzBkTjM0OWI5QzF3N1ZDR1FPTEVOdlBCK0Yy?=
 =?utf-8?B?ck5KbThPS3VoNjdHYTYzR2ovc0VYT3FXVm01MDBndVpEKzVkOWtucnhPODBv?=
 =?utf-8?B?SFhUYmlRaEM4aVlaSjdKZCtJV0FWTGVleHhRMjBkR05HSHFaSWFGSmt5aks2?=
 =?utf-8?B?UGFuNkZjSGlvVEFwMEg1Qm50WVZ3UGd1N2Y5aHExeGYyRVcrVndLRWxScEVp?=
 =?utf-8?B?L3daZS9UaHczTU1jcmdKcCtrb0RET0pFeHFqVDluWFlJbFErdXJPL1NkL1hR?=
 =?utf-8?B?ajF2enJ4UjVFSGNpczZMNWpuNUJIMTBvckpzTjc5L2tNTGk5ZUh5UDZQOFk5?=
 =?utf-8?B?SDZHaE5wOWFGa1JHSHhsRkhzWWFGSmptZHI1d200d1lTbGE0cFlGOXEyRUZM?=
 =?utf-8?B?V3FtSVQwMkxDbWppOFAyRWo3RENZM2dXbjZrTWgxZmNFVzVHMURHS2tmeVY3?=
 =?utf-8?B?VWQ5YVEyV3N1akhhVmNmSkZHM1M5SzJ4RFdiaVhDSDNIeVJjVHEwTjIyZ1VL?=
 =?utf-8?B?dFpjZHZBcWVUdDNzZEhRUWZGY1hQU0VTNVZvcjZVNXR2L0xvN0dkY0pwZjh4?=
 =?utf-8?B?V2VVc29GdDJoSUpKYU5uODdZZHU0RGNHNGhiRytsRDFpOXdNSDh1NGJkQjV3?=
 =?utf-8?B?WEtURE5vN1kyTG9jRjNObGZkWmRLWHJ3KzFzeVR3OWhvcUhPMGpSWnJpaENx?=
 =?utf-8?B?V3JOalFpZzhCbDJ0MlczMWY1TkZ6aWk0R1BSTnUrZDBZcEZVRzFjbFpKemVV?=
 =?utf-8?B?RzVOUk9JZUpCNGlKc1EwSFU3d1J0RkpMZmtOb0lMVUZVa2h6N0QvL0piVlRM?=
 =?utf-8?B?RnZrRjIzem9laEd3RVNmT28yVjl3Sjh6RVlJN2JjRVlpbksxK09Yc2N0c3lt?=
 =?utf-8?B?WG9DeE15Z1B5RVpQT2p5aEhkTDhQZEt0aXZ0RE4vS2c0cmg1M3FzNThhbUsz?=
 =?utf-8?B?UmttelhrSGlpdUh6UGtZZDYvaFhxSUJrSXUrbnV0amhsVElKOUJIcHMydCtO?=
 =?utf-8?B?WlRGdmFmMWxrRWtqZWVnRlJFVUNZQXZjTUFGWEMrbExDYjF0clplWE9ZNkVQ?=
 =?utf-8?B?L3p6cTJ4YTI1anBEa1FEU0g3UlN6YnhhTldqeGR4MkNGN3FMT1F4YjVGVjc2?=
 =?utf-8?B?VXNWQkpwNmVwd25ESkVvRlBtQlJUeHNOWlZFcGg2czdaUEs5LytwTHVVNnNa?=
 =?utf-8?B?bkxDVjdDS2dQZUJHV0M0cW40L3pQOXJmMnRLSHRud2MzR3Y2RTNOYUtpRlFz?=
 =?utf-8?B?NVpHbUVnT2gwUEw4L3IxaE81UEJDbVUwY0RhalF2ano0TGlnTGFUaFFCdm52?=
 =?utf-8?B?bnl1NG1LcHV0dHJEbXFyVGhnWm9WbGhwMG1FakVEM0VlQWRhdTNnOVNqeFl1?=
 =?utf-8?B?bksvbkZxMkkwam5rRmxNdG51YkV0Y2NMTmJyNHVySkxSWEE1bnptMDJNR0x0?=
 =?utf-8?Q?1pjxVnTTjQCH6Yy+P0RyiNYfAVFEVa7Cnn886B3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f63693fc-a721-44ed-2185-08d90f1faa17
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 17:11:32.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXJxIpNuZyFlsJ7urfbgqLR6bZ+ZUEwmXgufrYt8tok03xONj22RF/q2/SkxBv9hyFnDZef3J72Po1FiSzdEp3pwbJr47kPphCDJQ04a/TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5440
X-OriginatorOrg: citrix.com

On 04/05/2021 12:58, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 04, 2021 at 01:40:11PM +0200, Jan Beulich wrote:
>> On 04.05.2021 12:56, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, May 03, 2021 at 12:41:29PM +0200, Jan Beulich wrote:
>>>> On 30.04.2021 17:52, Roger Pau Monne wrote:
>>>>> --- a/tools/libs/guest/xg_cpuid_x86.c
>>>>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>>>>> @@ -850,3 +850,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, c=
onst xc_cpu_policy_t policy,
>>>>>      *out =3D *tmp;
>>>>>      return 0;
>>>>>  }
>>>>> +
>>>>> +static int compare_entries(const void *l, const void *r)
>>>>> +{
>>>>> +    const xen_msr_entry_t *lhs =3D l;
>>>>> +    const xen_msr_entry_t *rhs =3D r;
>>>>> +
>>>>> +    if ( lhs->idx =3D=3D rhs->idx )
>>>>> +        return 0;
>>>>> +    return lhs->idx < rhs->idx ? -1 : 1;
>>>>> +}
>>>>> +
>>>>> +static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
>>>>> +                                   unsigned int nr_entries, unsigned=
 int index)
>>>>> +{
>>>>> +    const xen_msr_entry_t key =3D { index };
>>>>> +
>>>>> +    return bsearch(&key, entries, nr_entries, sizeof(*entries), comp=
are_entries);
>>>>> +}
>>>> Isn't "entries" / "entry" a little too generic a name here, considerin=
g
>>>> the CPUID equivalents use "leaves" / "leaf"? (Noticed really while loo=
king
>>>> at patch 7.)
>>> Would you be fine with naming the function find_msr and leaving the
>>> rest of the parameters names as-is?
>> Yes. But recall I'm not the maintainer of this code anyway.

This file in particular has been entirely within the x86 remit for
multiple years now, as have the other cpuid bits in misc/ and libxl.

> You cared to provide feedback, and I'm happy to make the change.

find_msr() would be a better name.=C2=A0 As for entries and nr_entries,
suggestions welcome.=C2=A0 I couldn't think of anything better for the low
level helpers.

~Andrew


