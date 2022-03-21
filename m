Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7E4E25D6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 12:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292946.497533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGfj-000674-Op; Mon, 21 Mar 2022 11:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292946.497533; Mon, 21 Mar 2022 11:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGfj-000651-Lj; Mon, 21 Mar 2022 11:58:03 +0000
Received: by outflank-mailman (input) for mailman id 292946;
 Mon, 21 Mar 2022 11:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaY=UA=citrix.com=prvs=07205606a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWGfh-00064v-Nm
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 11:58:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26714c34-a90e-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 12:57:59 +0100 (CET)
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
X-Inumbo-ID: 26714c34-a90e-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647863879;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wDzTYWOCALf3WjWq1TqgTDcJrcQI4hDGGiQnxtTySGg=;
  b=Gu8V6HgtmZ7iXLgxczRRwAIbngC5tcXw85PkSKXXtLM80a5T1Eu8/9qW
   t3QElQ3R9iyWVtbqw5GxYpbcPI37b+jhLU/Y7sdXAmlwx7vUgtDqaGr8Y
   Q0CMN8JQFFjIJEGCqEllL5gCigbPOUNWgDv8YNI+hfaHFotoLCDI6yonn
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69121876
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vNb0T6/FDSUrxPDyB466DrUDk36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GcbWT3Vaf7YMzGjc4gkao638h4DucPSyIJmSQE5+CE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oLgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ6zdDs4BIPVo6NeED1pQn9FLKR8qKCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4fRKyHN
 5VHAdZpREvCUjoMBFIoNJJgl76FgVnnUGZ5iHvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3Eru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLmoHcwJQUvI/j4h1Bhgbh
 wGyjtrTVSM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1J1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 xDoeODEtYji6K1hcwTXHI0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2O2M
 BaL4FoBvcQCVJdPUUOQS9jsY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKOoNBJcgxScyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:zJ5wmKmJQoeIKfLj0JoD793lTuLpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="69121876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhwIcVFpSVQ7UACUM/4/Kt/NESyTr/L5xFQsdI+xh70I5O7pJPrxbqiqZyOklWSV8YncdPaGlMbzAS6niqHR3LLFIZATWaalvjoGhNM7IsRn4RYkDqrkQmY9Snr5Deg/YdQmpH1vXAXkc+CJQqf3YsIQpu6AEcyTskMPlw2IhsvSFIBYynnwfo1ATykz/QMcdxqPVH6YMv7hAumvEyVYFhQAc+sad2BiGD/4H+oUx2uOI+HtOrt2bJ+8DFNXW5oLDxnh9dU5WeM3GkYOjzK5z6I7FcjEHWscQIIKvqp12wB30G4Xm7BjhXGH5pWjzaTiNI1DxEt1ZSU0DIJVwBxysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDzTYWOCALf3WjWq1TqgTDcJrcQI4hDGGiQnxtTySGg=;
 b=dxJU6ARfcqEOosl4wJ/9/9tpDa3cxDqSnte6BSWCokKXZRCIpURmlsVgu7XI0sa2nDr/SCluRISQyB23MQceV3nMl9s8EIEkKcB3tF8nvY95Mk9loRwu+UHG5SydIkOUBFu4tjPyyJ43SFqDRWIGrSyFNmuiM2NUmLmb2R+Hy9iLpCyvkWL6XkUIETf4E+1kw/rzuH7hXMxIDLL2z9gpIt5L+OERLEmI+KCQvoeRKYOqYvCfs83uAD8iRSOwKiflMWsoi9DVqqzHAO3rn5oPMVHkWzSdwSsREagt1pUKjF2r0YIWXyRK0/mYUkgrskiTAAla53Q8e+j2+JjKwNdbkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDzTYWOCALf3WjWq1TqgTDcJrcQI4hDGGiQnxtTySGg=;
 b=YKW+IKPcwl4imvnAQNPjiArOx7atl1TQC/vS+lKJwfhsS+Aa1P5N7TK3LdQ+XCR3rrDD9Qwjy9xjomsdgbC8O/ag0Y72wkRyIEMqbAKSDgrHpr+TA6651n4YEJO6tR/hV8Ia1OH7C3Lfi05ZVV748Ej7W2fjII65iu86xzPnvfA=
Date: Mon, 21 Mar 2022 12:57:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] x86/build: work around older GNU ld not leaving .got.plt
 empty
Message-ID: <YjhoPeWWj2B0Kcts@Air-de-Roger>
References: <057172d5-437a-347b-b5bb-d102b6b37f0a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <057172d5-437a-347b-b5bb-d102b6b37f0a@suse.com>
X-ClientProxiedBy: LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c0d81fc-77cf-4d3a-e40b-08da0b32088a
X-MS-TrafficTypeDiagnostic: MN2PR03MB4687:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB4687D7488F4FBFA8F04886388F169@MN2PR03MB4687.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lJr1V2kxaPC6LwjcvVPFACIGcdXnnC4pD2Zfo8ysbIAKO3uiBXfE3RF6rCsHxET+U9TWLl5L+fliOU532MLHtEGgAIJWLy2AX131tfa4QsQ07N/3cJInmGFDtGmqGmCgjVff7rSa4WBO1iC5R7doQVO/tBsm/S1Q4LvsfWvl4Un+e9gaeuXxchP//mUTFDF0m+zBhyOPlkz5p3M2HlWTxZ6k74aagHwrecmOkbejneZDcAiFfB4nYHtt/Mu5D6Xlej17U4DINNyRCavj09YHIXLHTFCvHC19XMimmPdMzuPN/fn2eo0LGWMJhkuaK7bkmvj36nghnqerymV84t3QxKY7xIKH4AsBBRxmUBIrPdk+DJqs297l5Om4dRtUVpmlZNxdm/UoCtY4YcWhRmLrcps/8AmrL9tvkLb9bTA48ZHHaGQJQ/vJpDz6E60ALYCh+5aKDJlUttjmMYi0w02+EyEltfxFwCRu4UO5ZcwWaN4yopMGaq33h1WRl+TcBNK/SZxt2Tb1UmyFZS5eniSjK6om2IyscEY7NK2SgxaLTcuJ4hA6jtSctvwOpbV7kbfC/6f3WuuF8RIjhaB+wZDIoiyL7cfWrc26cCBEpR5MO+oiq67Otty7hgevfbv1r/MRSaDJnZ/C4PAv/KanVnhnpHYTVVnuO6B2jvZ38TW8F/rO1aF8DPvcBhVNjWMpFuIQD1u9H6BbqVLXbN4UKe3KHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(8936002)(54906003)(4744005)(6486002)(6916009)(86362001)(2906002)(66946007)(66476007)(66556008)(8676002)(38100700002)(316002)(4326008)(82960400001)(9686003)(6512007)(26005)(33716001)(85182001)(6666004)(186003)(6506007)(508600001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ektMVHY2d2RGYVZlbnUyZG4zaCs0VTJab0ltZ3BLVVR5dCtjYXRqQ1NSSFZX?=
 =?utf-8?B?dDdadGs3M1hNbzgySTgrR1RIM2VrTnBMSVBqemxoOUYrd1k5MUZrMXpERUJN?=
 =?utf-8?B?QUhqTzlzQmxLRGsyeit3aUVrZGNmcVJpc0JMWGd2VlRsT2FSUjFBamVjWGRW?=
 =?utf-8?B?a3FySitCQTdabDdtRVRNMjlIRnpGYXZnQ0huTGRyZ1JPMkhHYldKVFdYd3ZN?=
 =?utf-8?B?bVMzaldtaWtHK1ZFYXNUek54OS91UjdXMW8wcDBQY0s4dWZoRWNrdTBSck1m?=
 =?utf-8?B?RW9QTUNxT2N3eXJqQjU4aStwOUttRExiRGZ5dWd5NVVMbzlycmNEZmpFdks5?=
 =?utf-8?B?WDFFd1M4QVlzaXJZY3dLU1hoQm9CNGdSbG9aVG9nMTA5OTR1OHpUKzF2bS9Q?=
 =?utf-8?B?MHNRR2hxSzR2eU1nY081cHNwVHNlTkFPamtIdVV4UjFTL1ZqempTNzJZWFlq?=
 =?utf-8?B?K1J1UjlHdnM1OWV3WlpabWR1b3UyQVNZRXdleUYvZWcwME1mdWlMazZEczlC?=
 =?utf-8?B?V3JvYVhiY1gyY0kvME5TVnRRNU5WMkVzaVI0YVZ4R01VRENaODlBTjA1RVBk?=
 =?utf-8?B?YUN5SWhYZ3ptZENBdHVITzJnSUVTMTZhRWNIYzJSWlV3UHY1c1c5Ykd2aHUr?=
 =?utf-8?B?OHdyeEh5V3J3MlltNGx5NkQ3aHRjYVZubXN3L3N4clYwblVwM1RONjJTRDZM?=
 =?utf-8?B?QzByN2tpa3VFRlRGbVl3UVJCMzYzaXl3aE1EYkwzMlU5Y2t5bERwcUc2Mkxj?=
 =?utf-8?B?OCtoM3JKTTEzVlN5U04yN0JUUEtjK1A1bjhmcVN5YUFpRjV0emVIQ1A4YjhM?=
 =?utf-8?B?WGlCUk15WnloN3dScjg2TVlERS9OdWo3ZktydWJ2SG5YM3puQ3AvZ25uSGVv?=
 =?utf-8?B?OTJNSldubTh2SEk4NFhPb1hlcVovUWtEbU4zY0MvM0FMSElJTE9LZDhOMFpQ?=
 =?utf-8?B?NnpMM3g2N0dZYjNsOS9KR0tIYno4L1I3MTd6a0x3dW02Yi9RaU1ULzJmaWRh?=
 =?utf-8?B?a0J2QjJOeHE2YlZSUTlLWGt0RXBCZlRrMFoxazgzY1JqTTBURDNBUkJNRUVH?=
 =?utf-8?B?VVA4VHRRNk5GRFA3ZGpjdWNhSkdWd0RUQVlnOUs4aHVUTFdvQ053OHVEV0Fq?=
 =?utf-8?B?cHBBUTk4VHFITFNlRGdSM2lBT1hoYkR5S25GS1lyL3dkWHZ2amtJbWdEQVE5?=
 =?utf-8?B?eU1PRndPbHdjejNQUzJ1V1ptbUM5RzQ3MmxwSHo3V2NaYTEyNmVoWWMwNTR5?=
 =?utf-8?B?RGtWL09wMzcrMlBYMmNmRFdCak9GNmFRUG8zdlI2eFRoZThzU3NTdU51djlR?=
 =?utf-8?B?R3Q0WFB1OVJJR3l2MW5XRTBLWWkweTdYUUpNRzJhejhKTGwwZmlNa0M0emxG?=
 =?utf-8?B?MHp2eHlldGcrNlRxQmlUVGNUbXNHMWk1Z2lTcUd4ZnRVSlBnWlJnUmFxM0ov?=
 =?utf-8?B?Uk0rM2IxaGdXWURzRmxvNlF4VjV3ZkFYY0RaRmhJYi96cXlsWW15L3lzVEVv?=
 =?utf-8?B?bi9aNHBmNVFwV0pVbVZaYVorODJ6d3dlZ2E3L0tHRGZkRVZCQUZlVitjWDBD?=
 =?utf-8?B?R1h4RFBmN1BiclQ1bkI1RGZHczc1eU9NajdsUXYzWmJ6TzJZMkRWenE3KytQ?=
 =?utf-8?B?QlhkczFlcUVnc0pUTzkxR0NOVTEyejlHZkkrTjVHWHZNRmJMeUh5d1UrQ2U0?=
 =?utf-8?B?UWxrQ2RWMEFScmdhY1J2blJlYS9rR0F5NmxPQytRdEM1TDVlMFlXY05qVWJD?=
 =?utf-8?B?UXVSazRQRWphSGl1YkdhYWpYcVdBRHQ2TXhoak5DYmJDbytzOTFpdzUrOFVL?=
 =?utf-8?B?TnNKVGx5Mmp3ZFlHejJDZDdSN0lLNzNnQ3FkT2dJY0Y5bmt3RE44SGw2SUcw?=
 =?utf-8?B?cXdTWFl0cEFYTEt3Rlk3SXlZcFBjYTFYOFZpUXVrcmQ1eTZ4T1RYQyt1LytV?=
 =?utf-8?B?Zm1XUXhTZjVSVkFzU3JqbWs4cnFhYWYxWDVEY1JBN00zdHdtcE92MW52WGxs?=
 =?utf-8?B?RFZQWUE3TkpnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0d81fc-77cf-4d3a-e40b-08da0b32088a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 11:57:54.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnIBSI7k+WZN2YIn1MB+B2+CCI8kQdBsRHg1lGTJwtxA7JpvDWHRtM1OGW/pdd/3JLrglsv7rzc/twVO2E898A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4687
X-OriginatorOrg: citrix.com

On Mon, Mar 21, 2022 at 12:46:54PM +0100, Jan Beulich wrote:
> The initial three entries in .got.plt are "static", i.e. present
> independent of actual entries allocation of which is triggered by
> respective relocations. When no real entries are needed, halfway recent
> ld discards the "static" portion of the table as well, but older GNU ld
> fails to do so.

Do you know what this 'static' entries refer to?

> Fixes: dedb0aa42c6d ("x86/build: use --orphan-handling linker option if available")
> Reported-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

