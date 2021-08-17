Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B13EEB03
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 12:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167728.306197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwOM-00073Y-RI; Tue, 17 Aug 2021 10:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167728.306197; Tue, 17 Aug 2021 10:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwOM-00070q-ND; Tue, 17 Aug 2021 10:32:22 +0000
Received: by outflank-mailman (input) for mailman id 167728;
 Tue, 17 Aug 2021 10:32:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFwOL-00070i-Ar
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 10:32:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0254df5-33fe-4750-b399-be8599194cf4;
 Tue, 17 Aug 2021 10:32:19 +0000 (UTC)
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
X-Inumbo-ID: c0254df5-33fe-4750-b399-be8599194cf4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629196339;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FH3az84OQ7RqUyl/TtEf6Aj66Gblu/fxDNlJU3sDPuA=;
  b=YoHYbfrUo2YMPxjSgC0qi3mmH+TNlK85i9WYoKRP9thQWWsYktAa5tgb
   kb2SUseU2bagEi4iwchevxPreR7vZ/KdB+KGh8SKaEJ8mN3Ea9acDjKt4
   m6RywBsr6AM+Da4gt9hwcFpjm16vxFvHjPwpiVHvVNR9MPy23zpULeP3W
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yPkGe/GFo/3JeZm5QaR8rrHW4p0u2u4EBmQ+6WBhFYDB4YaODTDHDJYE4yZmOfpFXJE2D8SgFG
 0xJGKhNlAZozqmsizFHyvYWxXCLNgLBBFFjrEdV+HMYbMvLSQdjXzKNw4o43y76k1TeWEQTfxv
 PhXYQP9mxvICM2OKxnLZrkbbflqvA11ZfHZZZ7NMdJ8W6tfS77UYh0WWPfocslGuA2FWE2tptp
 KCazkN+hnILa4OP9F0DLWTSeY2JMf51nLBV39utYQIUzo8AV1zqRsl4KOUohfGdfVUU1u/ejmW
 Gm1Af3WHrnb7zNZDOhb/Mskf
X-SBRS: 5.1
X-MesageID: 50603763
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cFQX0aPuufGTY8BcT0/155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzY4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 fxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72yeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlNXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbVrmGuhHjTkV1RUsZuRtixZJGbBfqFCgL3U79FupgE986NCr/Zvx0vpnfkGOup5D+
 etCNUiqFgBdL5PUUrRbN1xN/dfMVa9NS4kBljiaWgPJJt3Tk4llKSHl4ndxNvaNaDgn6FC1K
 gobjtjxCcPkgTVeJaz4KE=
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="50603763"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3J4vQJyah7lVEY4qpWh8b0Sz0NsEQdUgwwlArMynttd+NigucksfjoFxpDyruri6f167WIV1ELFon/dniQVhz0ujXR1yF2fJPnNF0DP6e5OwF11U1Uo094nzqa2A3s9UdXKfrBkLSDvEgxJv6kXPQMmZsqKg5cPWKHLPzCoSxeV8ViWuwxPRLBKoBu9JQhL3nlKPZRvNDrFvXpyTOZt84/E4nRsE2k0rFvQsIXoRD1yC/FiKJPSXGQcxLFMQ8fZ6mmBDUVj8QPgPD7siubtT+wEj3Qq3CT/9WvuUwdA4Ds1QNijkIwruR7A+MC6BpxuPxt5f17XSD+dlAR6N4WKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEcpuuY8soouLWf/Xz3iC2b8bjxwwZIJkvWqFmFlUBE=;
 b=lF7x+Ho89L6F3YwINGXEMPQvZvTSVFOcKZDHZExqIVuk+k/52WBy3XMV8iHy8E/OdPvO5IKcR9z5NjdRnvnIOH/QPg1ywxevjNkSdSDa3n4i7Kx79IzzBVaVUIWyr2deRsPEzLzLLdOpPMJLR07o9w3xLoIDkqZIrAUS0CY45BLNouUV21Ph2t5euD91B7PObCbmvJXVDvhKC5IFvc+nvcldH0nyayftbu8oLuMpHAGxppi1XQrb0oA6FXBDfEKo36XK6W/r0TQZaGofK2gtaF7zI5ID5iRZRnl3WEjBY0vGX0Ve/6fyCuQDqZt+kGJeHpI3unRo3/7mhm+piG6Ijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEcpuuY8soouLWf/Xz3iC2b8bjxwwZIJkvWqFmFlUBE=;
 b=o/fcKbhdxUYmGW6gBtXzOhEArOvykUqXZLWlCS10Sf1qjWNriln2dpzuqJYVlkyzwHImVjwQGRkQk/rKKPIrchgxkNl3dgy15T+f1qWGNPG7DV/WEiiVOsNmaZ6Qh6/ZpoIDuFRZ6sp9y6sZHHjb9siNMmTlNGJx1xscUtIFKSM=
Subject: Re: [PATCH] x86/cet: Fix shskt manipulation error with
 BUGFRAME_{warn,run_fn}
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210812170350.23543-1-andrew.cooper3@citrix.com>
 <4905f9de-8106-8a5c-c3f1-6a703b008d38@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b894128-e604-b377-e607-1e828b021fa2@citrix.com>
Date: Tue, 17 Aug 2021 11:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4905f9de-8106-8a5c-c3f1-6a703b008d38@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b40e1054-9399-4c8d-5297-08d9616a4140
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58374AF3F478FCF2B0BD1ED8BAFE9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/O/yVkePD6eS5vN3O7F7T+caaTzAw1L6wcc1rIS+AahWcNvCKxnVSJf5ecj3Oj89IO6D0vG2dHFXu5j1H6exo/a73neNiFim5RTBHDzBC2CV8fVhLd0YuywXYvHBH8B0nXXgo2ijS15bZ1J3DT6owNcll0SvJmKJJT1g0SJ9mCpS31kOOi4wrExW23st+uNhvAItVb3sHXhki8dacw3a3pN/LBxMaGZ180AYAXl2aRWjJZBZfrrdAiSTjiHOtX3k+rxhv2y/avCIVcHloGLDfm+t1Kp8pCtxYijG/At9hMnYrIxBP8IAAj8e9T/HBAclyBBhR8FVdZ1+JtbzWkFBcAeV2Q14R314S9F56+ltdPEXsz/hniLuN2/v/ys9sdulIwbtCNteVdw9CTT+G39o7MQW321p28X5Kul4XDxhsVEkPemD5G+pj34Psa/mKxZ/VmmCmdsWTl4jqtQQ46CFFtXkAINIRtiv2g7Y2oPKbzbgiviB/D81wyPFeurJLw5U5VJ29GCML2mDRbN+dQUKJLiq5tUHKjlahFOAo/Nd3sXtf+VV/GY42poj5QQ4AbH8SXzwZJSdV361irNjzdDD0nEB8UirabbB9b2f+smPiimCVfYISpWrtkZAt27JaNiBvSKJsv2LNQ9bsgBFl+0COjFkBmD5yAZQO5n0xrJMiinoyI9+StPp0hwi++MgKsmbBc+f/r2TWDxI4xVSsvVk9lyxQjEfqMHbN/dOkw7auM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(8936002)(5660300002)(38100700002)(478600001)(4744005)(316002)(36756003)(31686004)(16576012)(31696002)(54906003)(6916009)(2906002)(66946007)(86362001)(83380400001)(2616005)(8676002)(956004)(66476007)(26005)(66556008)(53546011)(4326008)(186003)(6486002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THk4Um1PWVpaYlVWSWxUYWNud0NEM1BoZXgrQ3BZSlJER0U3Yno1RnNGZTlw?=
 =?utf-8?B?Qzhjc2VBTXlWcGJkeGJHdStXRHVYZ2U0THlldWtnS2wyd0Q5V3VVTEV2UEM5?=
 =?utf-8?B?eWU5cy9pNDc0clMzWCt2cXJLN25IZFVydjhLcFFpc1NVOENWMGp2UE9HMzdu?=
 =?utf-8?B?V2dUSVVLNkZtcisyeDN3Mmw4dnJtQyt0WlBORDkwaXJwTEJodnpCU3hCdXR4?=
 =?utf-8?B?cWtUYlpDQWRta0N4c2FWRkJwS3A2eExkMVJ4L3kxUUlUWC9qRVVRUGlIMDFs?=
 =?utf-8?B?d2FsdkF6b3VSeE5TZEZnVUovQXVKNW02U25iNUdVTXpXTnpDSElkUjdGOTJK?=
 =?utf-8?B?Nmw3UHR6RmhRQnRMSU5pbmVQMzlzRWRxb3BTMVdrWlByVXlNMEVTMUFHQVEy?=
 =?utf-8?B?SzllK1hRYS9JQkFWVGFSdjg4L1paR0NPZUY2ZUk5Ky9sYTNTV1dWVTI3dFBW?=
 =?utf-8?B?UWxPK3ZJc0JaN0c0c0pzNmVic3gydU9COGg4c1F4YThtdmpacjhNV3FWUFZK?=
 =?utf-8?B?R1dYMGRFRkM3ZmdIbU1TQnZMaGVzSVV5MWExb0NqUHpxV2M1TkhXWHo3eGd2?=
 =?utf-8?B?VUNvSlg0RTNwdzlGc2dPVkplRzYxUHY0UGd4N1hIeTJhMzlybzJ2ajN0NkNm?=
 =?utf-8?B?QnBHL0U3WEpHdGN3VGVJRG5tY1BxNForbkdqWjROdnpqc3VBMHNMUnRQR3pp?=
 =?utf-8?B?L3gxT2NOMXBHaEdGU1Y3NjVoYmU4MUE1SEJiOXZXQm9BSUVMdkUxanlQVFg3?=
 =?utf-8?B?WXRoWHZDdVFMUzQ3K1E0c001SjJwS1NWbzhJRUd0YmRVdTBjTDVYbDVHTnRq?=
 =?utf-8?B?eWNLNzV6NDhrUlpCSlFPdHI4alNGVW9qYjZ2NWZHM2hUMXd6cVRCeG9aOStP?=
 =?utf-8?B?WXl4T0orS0Z1OUNGUk1Od3loaktrYzNhbE1DRDVJL2U2S29FclJVUkhGRjBh?=
 =?utf-8?B?THpBSk5NU20xTEpsSUR5M0JJZlZMMzZ5dzlmYTVXQ005TjhGSm5NSjdFdWFu?=
 =?utf-8?B?anhjQlFwQU5qbEJVNnBDWm1mRDZ2MHRjRDIxclprU0ZGSUVGaERUazMzY3pN?=
 =?utf-8?B?NjlWaEQzOVNTbllKZDBENWFqYlI3eXJsSXd5dWY0dDN2UFIyUmQzZVB5SEZn?=
 =?utf-8?B?TE80ZWM2QXJ6WTVDUTJDTzZKQmtuc3pXMWZNa3BoQjhpT2ZVZURPVGk5LzdW?=
 =?utf-8?B?a29KTi9WY1JVemhhd0k5dDZmdzF4akc3N21jWXlLTE9KSENyRHpBb3VaREgy?=
 =?utf-8?B?c3pRcWRuU1Ira1Z1KzNYR3p0b0xyUXZWMjFDbDZ2Qk95UjJKbW8wdHA2QXFD?=
 =?utf-8?B?dzlmMjluVXhHMXM4RWZubHkvd0xiYk1lUjJwU2lWV2JPVFpNTTJadXhWNDdp?=
 =?utf-8?B?ald5QXZFeCs1MGJQTDN3RGwwSFNOcmR3aUsxQmxCUkVqU09UVEVNN05Ba1Fi?=
 =?utf-8?B?a05rNjBpcjI1RG9IQXFBeWtVVmRWS3EzdEtXNHBCM3BDZU9TeDV0S25zTDFv?=
 =?utf-8?B?ZTJBOXZMMkttQmpkalNwbkhabW81VVNabU1LcnQ3QU9LT0hZNXA3aTdSUFVj?=
 =?utf-8?B?UWZaaEVyc2NxdDFYQlJJUXkvenJ3Rng3bGlRRkFTaUFTS0xodUxCM0V5cnFP?=
 =?utf-8?B?RG1SUGNYT01PenNRRGpJOXFWanJsSjh2TXFPY2ZUTmNaTkFpYzE2bWhqYUlR?=
 =?utf-8?B?NzloaVFRZkgySm1LVlFKcmw2R1djQWJ4cWU2VkcwS3NHT1BoQ3BkTUQwK3lt?=
 =?utf-8?Q?LYNSgCgRRszdAIwqkt/8vVrWXkbXTVkR2hg89v7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b40e1054-9399-4c8d-5297-08d9616a4140
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 10:32:03.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/F2ZQOjVWPqDQqboEk3ZZhtfE4C6mGUovEo/o557d1cBxxPJ1Kka1sGkxoZpt1gqitdgMmTv0voPbCdNCiprF6ETgCFRQsYXOO3vbO5g8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 17/08/2021 10:10, Jan Beulich wrote:
> On 12.08.2021 19:03, Andrew Cooper wrote:
>> I'm not a massive fan of the large ifdef area.  The logic could be rearranged
>> to use IS_ENABLED(CONFIG_XEN_SHSTK) by indenting most of the function, but I
>> can't see any way to drop the goto's, and this is certainly the least-invasive
>> diff.
> So perhaps the build failure I've just run into (also apparently spotted
> by osstest) suggests to actually do so? The alternative would seem to be
> to widen the #ifdef in get_shstk_bottom() to cover the function as a
> whole ...

Let me see how the options look...

~Andrew

