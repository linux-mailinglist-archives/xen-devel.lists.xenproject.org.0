Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A303BD7DA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151329.279680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lEO-0002F3-Ce; Tue, 06 Jul 2021 13:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151329.279680; Tue, 06 Jul 2021 13:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0lEO-0002DD-9X; Tue, 06 Jul 2021 13:35:20 +0000
Received: by outflank-mailman (input) for mailman id 151329;
 Tue, 06 Jul 2021 13:35:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0lEN-0002D7-1o
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:35:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66338781-a714-4c8f-9cfd-9b59613fca82;
 Tue, 06 Jul 2021 13:35:18 +0000 (UTC)
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
X-Inumbo-ID: 66338781-a714-4c8f-9cfd-9b59613fca82
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625578517;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mWkt11idTzMY9cbMcNBR/8emjtRf/WHq12biu5kQa7o=;
  b=Gj5LXnOYCgE3q7N/fL+p4Z7WPga9YWgK69VFhouSFYoL2MMIIc39K7kr
   Dyk4Up6AmnJbu8kkAsHNEHZ97hs8CXd5aN3bsjTXcD9YOflOTTEhBIzSp
   42qRg7glRynVj+2MA8vX5zoA6z79MqqjJQSHESiiIVU5vTD9vPtu3A/cm
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i1rbDAP62lEWqbKwv5cCm2jtkPfQvq/GyrkwSmcYBY0NAtqzUMoqS2HCDd+Hu0jnyJoJV0l7S4
 x3LmqMaAzK33O1Wc3xeVMOsRs1YZ+B29743w1lripUKiA5chjZlYnY4mUoUlDHKHMVMT9jqEIb
 oW9Ka/Zwwnk0QblMFq3ecX2yXP5VqklxR2cXkhFVyLS9wTCdC/Rlx4MvzLmwIov8+1+WXBLjz3
 L4UZP+M/0wktknibWcgKCn9iUQdEaj1DASdIUhJ/taHQD7T0JQ7/MOvfbHWi1XrJCy0bDNRMv+
 0TI=
X-SBRS: 5.1
X-MesageID: 48023482
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:64bqpKHRnhoyQ1+HpLqFHZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pat854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsAuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Ts5Vma/pdVFZtl/1bwKsMe61wWB4SqbpXXt
 WGNfusp8q/KjihHjfkVgAF+q3eYpwxdi32CnTq9PbllQS+p0oJu3fw8vZv10voxKhNPqWs2N
 60RZiAtIs+BfP+PpgNTtvof6OMexrwqFT3QTuvHWg=
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="48023482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDx3V0OQVDuZ50smOxfa5R5kJaQ67FEJNCW6aEqhb5YsC04RkrFbx7f9qVIq+3tCQs/Q8sm/sECD5re6+FIZIi2OtpJ29F3bmB+uxIIp5eG44164OG4lWxJd/FzC8iV1n0aSG67KL4YLi3VgcgiNenrx3UkEeXAY/dNhluDAXsYuOJgrajaTpVYwaPL/PfXLI2P/nDoT6z16YV0+JR/aTlhOuHySbBqDsVx+Sp78EpxRZHdiqzDpHMPk1wIKxmQAeypl5j/7pSZGBOjDajAksnBX0mqS7rdDwqym3DrINaeA/Wh8MyN3EAT4JNTb1LcAiWsAoPlcd3O1EzeoN0eZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+V3zJu17mw4cxKdyPeOkHXZe+pHkyctt/iMfwee90I=;
 b=jayufHs9Wp7GeR+4WxDN6CiFSubUPpdD5tweJxphQJLVDUQKL/UJy/8P2uJcY9az0FVUmgpsC24Z6YGIAmeE6kLj3LUb/lq7ly5wqkjLQWptLgqEjPyl32okJdOz+ssEeRrpJCK+35ZLm+8HT6fCvq30aNJpbIYWqhSh9LpPrwB/YQjseuvrAtMwDwpv78RP9daipxRzaG5iBcFjm41yxvHJNpzD9FXM+889ruE0SZ4lM+J55pTWGueYg/QHvjiD4JIsGHHSTpJcZ1+d4rzQeCWhVTP7wEl/YeB0K6oY5PshJPZbY3lLUPbvoZZaDM4lklUBsHEdoTmhc8C9IAelWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+V3zJu17mw4cxKdyPeOkHXZe+pHkyctt/iMfwee90I=;
 b=q+/yJObsFfv2xFLKgb/YEiD2aiL65Ds7639O7gRyExYDUQ20qdkwXyxTN+PgCAoVViyGWbP0XwfeX8EArxYtG1p3CiWFg19cgIMKe4fdhyR3BZv/VrHmI8ynXcWVHJi0BMD/03QnP3JPJ5v9PIgqWtjAqlIjZ3Hmyc764+6LBAc=
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Olaf Hering <olaf@aepfle.de>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <d5bb77be-b557-3587-6cbc-3e427104c55b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
Message-ID: <6e5bb79a-1f90-257f-a90d-374cb206093a@citrix.com>
Date: Tue, 6 Jul 2021 14:34:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d5bb77be-b557-3587-6cbc-3e427104c55b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdd8f725-97e0-4293-eb3a-08d94082d4f7
X-MS-TrafficTypeDiagnostic: BY5PR03MB5079:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5079BF6C80A0CD99B624B978BA1B9@BY5PR03MB5079.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IB8IHEqMFy8knuPa+HNB5egY3XQbmKY6u6scd0JLYTsXzBc2t0iGEhdydYootj9+12a1iueSlfbI1thgOT5TK5jzAB4PnOIcR1T/jklD40hJVmCT/Gkud4LkNLQ34Tl8BTDAw9xSH5IH3ASbRkiEQnBcL98VBlFRF+/EkMhGj51dAo3BIImkjP19zBRnIGGjm41Rz3mr3Oi1PZ9fu/W28ioXXa3N4nTwpN5UKaOyD975SnLfIvnluThvxZXPxbRyZ6vzf3jeYTylkkoyp9gPBPQC4bi4r8d2OzJGAsqSQsXRHE1l9TE3Y2WEQxCCBnciEAf65koFmlkhoah5rxevLxLuz86/v5J6nPHGBc0ve5eUs1uX2xX9oFII4YCARekzFbFsjm10QpeDpXSUR2u80qPGDIW/+F6wVm979atP4SzuGYxwp3Sb8O+nfaEOMwKiK4FbHEFtXF3jeI7B2rxxvIMole8avsS+k7QIsaiUENYhMhglCNRtAh9mDQzNP9B3sYVi+aTQ7C2xSc+AQZVjl8+qginBRKhTK/oXYbh/MgxhB6Gw5UYrwBBiv+aMvE4uErOFqIobUbgj83umAJjcDvKpYIkn3oS4cosDJGadENc0CbcgD2LSqyUeI1JI5t1TSkV1BCJR49guntxSrbd5e4YnNB8MjAtGNBHVSnsjP0uIZa9p6WPycoJ7+PmvFzV/lU0HfFL1F/zcM+m2e2yfF+mJ2i4te/nGALI9YLv8O0E7fYvqPSlK/yoMYpxQ2L6Yyd6Jm0pkHetT5nCWOgrClg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(36756003)(8676002)(26005)(6486002)(956004)(31686004)(31696002)(83380400001)(86362001)(8936002)(186003)(66946007)(2616005)(53546011)(38100700002)(5660300002)(66556008)(54906003)(4326008)(6916009)(66476007)(6666004)(478600001)(316002)(2906002)(16576012)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm93UWViVVdmeDdYSGE2Y1lCR1RjMEtBR1o1anlVUUltcldIY2wyZk9vaytW?=
 =?utf-8?B?TS8rKzZIbHo2dWdKVDZrYTBXUkdoM0M3eTF3aE9GNFc2ZmUyMy9rSmxIR2V4?=
 =?utf-8?B?RnErSzRjWUJhYnJZWmZqbGxac3ZRL0FnRUdDbVpPaUIzMnZ5OEtKZVBxakVu?=
 =?utf-8?B?dUZWOEN4V3EyN2V2b0M2OXJGZzJSMnpyY3BxUHpHSWtCeGNoYmNrZDNzUEtk?=
 =?utf-8?B?TXRQTG4xRE9qSCtsM0dZejBheUlRbnpmTmhEeHFvY0UydStXZSt1ays1dHF4?=
 =?utf-8?B?WUxvbGlGUDdIaDR4UmJ4TnJseEZodENyaU13VXdSZ2hpUjBxUDRweUNNakw3?=
 =?utf-8?B?NHQ3WGg0SkxPZmUwSzZveVJ2cGxlWmVCc1lvWmtCNFduNW9sZ2drYmlSb21u?=
 =?utf-8?B?UkVRUCtzSXJ5ZHN5QUd1NXdydytEcFl2ZEd1Z0Z3THhlRDhBV2R1VGs0OUlQ?=
 =?utf-8?B?dDRDN1piL3VBSTR6b3NTRDUrUG1OUnU2ZEtwTnhzc0hkMGdaZHplRkJQUjZ4?=
 =?utf-8?B?T1lYcDRaNUhtUktsdzU3NEt2RDJwMWtLUGV1c1I5aTZxOVZteXdleHpENStJ?=
 =?utf-8?B?cmdOdTNKYkV0NXRCQ3hrUjFZa0N4cjNGVEJ6MHlscTRQNG1wSzgwY0c0SXVi?=
 =?utf-8?B?NW9xRklqRzl6WmhWdzV2S2lseFFvakQzUWx2Nm4wMGJ5NnJuNTBIUVNDdlBC?=
 =?utf-8?B?aXhLVTR3NWJrS3lqcGhzdW5sbTJTZWVGT2NDU3h4TG9xVjJ5TStDYldzeXI3?=
 =?utf-8?B?TDVwTzcxdjVxSXJXQU5kbVdpYm0veENkVk8vSXV6RDlqZk5tWmFiZ1F6VEFG?=
 =?utf-8?B?SExTNGVnNG14SFV3cUtsTEY0WUpTckJRaWVsVjQyYm51VjV3YXBDaDlBbW5u?=
 =?utf-8?B?THRZNmtvSGZ0T0lpdGl5ZFBFUlIrbC90OTRVQWxDM1o1d2RmcHJ4V2ZCRWVa?=
 =?utf-8?B?TWVaUTZjd3VWcDlvTHJ2c05GbE9mT0ZzM1F0ZnpIY00xWFhnbHJPS3U0T2pE?=
 =?utf-8?B?L0p1VnRQeW56dzJqOHRRejVLd2hDT3pUVnMwZGJIUEp1K2ZobXNNWFV0bzha?=
 =?utf-8?B?Q3d3cno0T2w5VnVxMDFFbHNPckxHNk1iNG50cy9rRlMvTVBRUXdoRWJacExx?=
 =?utf-8?B?RldVQVhTc3FLNWVlVThVVlFJRElrSVI1MEVoS0JXTFlxcmhscHhQbTk2Wk8z?=
 =?utf-8?B?VEt1ME91WTVxZURveUk5QXN6N29Hd0Y3Z05XYmFjd3VDeVlVNGIxVG1FNnQ5?=
 =?utf-8?B?S3FIZytMZG5tMHRzczBuMnVIZVlESzdnK0J1eTk1ajV3SVIrejFpS2tVRDRE?=
 =?utf-8?B?RWEya2NSbjVaVzNGY3A3OHROWlNYZktjWDZtSCsrRU1uUXV0RWNOYytRRUVR?=
 =?utf-8?B?SkxUOEJ1ZUFJTXAvRVZueFdycmtMQkE1a2hsREJnSCtkbTNpT0FVQ2JiRlZH?=
 =?utf-8?B?SGtER2hQem5pOVFWb1VQM1RDTVVqaENuWnZZS2dHaThQdTllZmU3Mm5hQjNE?=
 =?utf-8?B?bHdMV2JiZWJRMTBHUk1UckZIRXVWRE1vNXNuMkFYbzQ3bmRVSHdROU8yTzZQ?=
 =?utf-8?B?QzhNeFE0cytRdzFsWmovbXordjJmaUxIa28rRW9uRXI4Vm50UTU4UEFkb3pX?=
 =?utf-8?B?SVp2VnZJczhNcHVaTk82NDRsV0c5UWNBc0YvVWlmc0JOM2xLbXBCS1JaKzJE?=
 =?utf-8?B?Tk40UWwrd2tOcnhSRlpaK3hVM09iSm5IVVpTNmJGa3B1d2tWV2N0RFNoR0Vy?=
 =?utf-8?Q?guY/fbT3gsoUe2ddR91Oo/322lqnSSvpHw6gQ5d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd8f725-97e0-4293-eb3a-08d94082d4f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:34:51.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJug7SeuZIKB7ZfhapoMJ7fv4B7p9CtHSno1FAA0YvnnnQ7pHOoXsO7IY60B9udnUBadNQGXSDRCJgyfKwJbfoA7yiy+9HClaD0Kz6YwduA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079
X-OriginatorOrg: citrix.com

On 06/07/2021 13:03, Jan Beulich wrote:
> On 06.07.2021 13:23, Andrew Cooper wrote:
>> 'count * sizeof(*pfns)' can in principle overflow, but is implausible in
>> practice as the time between checkpoints is typically sub-second.
>> Nevertheless, simplify the code and remove the risk.
>>
>> There is no need to loop over the bitmap to calculate count.  The number=
 of
>> set bits is returned in xc_shadow_op_stats_t which is already collected =
(and
>> ignored).
>>
>> Bounds check the count against what will fit in REC_LENGTH_MAX.  At the =
time
>> of writing, this allows up to 0xffffff pfns.
> Well, okay, this then means that an overflow in the reporting of
> dirty_count doesn't matter for now, because the limit is lower
> anyway.
>
>>  Rearrange the pfns loop to check
>> for errors both ways, not simply that there were more pfns than expected=
.
> Hmm, "both ways" to me would mean ...
>
>> @@ -459,24 +462,20 @@ static int send_checkpoint_dirty_pfn_list(struct x=
c_sr_context *ctx)
>>          goto err;
>>      }
>> =20
>> -    for ( i =3D 0, written =3D 0; i < ctx->restore.p2m_size; ++i )
>> +    for ( i =3D 0, written =3D 0; count && i < ctx->restore.p2m_size; +=
+i, --count )
>>      {
>>          if ( !test_bit(i, dirty_bitmap) )
>>              continue;
>> =20
>> -        if ( written > count )
>> -        {
>> -            ERROR("Dirty pfn list exceed");
>> -            goto err;
>> -        }
>> -
>>          pfns[written++] =3D i;
>>      }
>> =20
>> -    rec.length =3D count * sizeof(*pfns);
>> -
>> -    iov[1].iov_base =3D pfns;
>> -    iov[1].iov_len =3D rec.length;
>> +    if ( written !=3D stats.dirty_count )
>> +    {
>> +        ERROR("Mismatch between dirty bitmap bits (%u), and dirty_count=
 (%u)",
>> +              written, stats.dirty_count);
>> +        goto err;
>> +    }
> ... you then also check that there are no further bit set in the
> bitmap. As said elsewhere, I'm not convinced using statistics as
> a basis for actual operation (rather than just reporting) is
> appropriate.

I'm not interested in inference based on the name of the structure.

>  I'm unaware of there being any spelled out guarantee
> that the numbers reported back from the hypercall are accurate.

The live loop uses this information already for this purpose.=C2=A0 If it i=
s
wrong, we've got bigger problems that this.

~Andrew


