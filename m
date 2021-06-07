Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957339DE60
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 16:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137984.255537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqFwh-0003r3-VZ; Mon, 07 Jun 2021 14:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137984.255537; Mon, 07 Jun 2021 14:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqFwh-0003nu-SF; Mon, 07 Jun 2021 14:09:39 +0000
Received: by outflank-mailman (input) for mailman id 137984;
 Mon, 07 Jun 2021 14:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Idvh=LB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqFwg-0003no-DM
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:09:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea83ec53-30c4-4d5a-a7f4-897c878f5954;
 Mon, 07 Jun 2021 14:09:36 +0000 (UTC)
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
X-Inumbo-ID: ea83ec53-30c4-4d5a-a7f4-897c878f5954
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623074976;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pRcrHc4fsYkSgM57XNquEipXWbrxGeP1ZX49/+dIF5g=;
  b=A7F1ZA8uPWCF+Rt+J/jSB9Zalh1zmKhSOV9z4MwBqSFsGVq43NjXUcaf
   E/TFzy8bBch6PShRCDNiZpuH+8mMtCItDb+b6KusZ6K7nA9hDWBgaGxMj
   Y52g6buucc44Wr8m+c+coUthPrhlSnCFKAxHwIo1si1ROHDx2Sk2xhv2h
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pUE7hOyVyVLIJHXPinwnv4Gzh78Lk6HMRf8Fb7HkAaOMjJx9urjXj0qYx5CGl/2X0QbNTBNhZR
 xgaaNbDUAXSLjJo3kPQnY5vzLU+3ma4sd6GHmEocgiMkAtr1jL3PZ6rsV47Yhwe3q4mXQ5eSGz
 4zG8jHgVHDS++khg2uDxywZWq/6cAGQl8Fx9PVY+gkn09jg2RrMXRxBh+4LrinoLyk7VSVy0mi
 EBsKoktXAczTiNNXqPrJ5o4DKWNBhyfuQA/EEycStojM3igZ4/XV3gonFJgnhJ93oVmlCvhlOw
 dfU=
X-SBRS: 5.1
X-MesageID: 47104490
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:lrMzkKB7sL6YijvlHenP55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8cjzuSWftN9zYhAdcK67V5VoKEm0naKdirN8AV7NZmfbhFc=
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; 
   d="scan'208";a="47104490"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwTpZRYNNDuunSOcS+zMfdwHpud9TBwG333/RRHULCz9Q8p8++X7PDv5y2bxdCH7SRZmIoyaom/OtkRCqkzwQ1SEp67cnJLNdZm/oKu/Xi4yddeEzBx2gXmydcUaHGkUElzRpZEwL0azRs2p8jEFB0D2ICfLm7spCmKKQNH6+EnB1j5WY/UNP0kujGTGmhFNwiDnHpNtIw73EM3epKvavhhV+92b423l8kzGjO4R7OU/3mKwzXAM6TOPfDPGj2+6n8xdZWAqm+hIINJw+An5KvyLXNJvHm2k2Y0VFiudxQdNGGN7wa2ONgWK+m7QO9YRTWLKwirC1paZRPs0Cd5b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA6whvAbHknALXPo49Zej0ng4Nmw1TYfNVp8NHz3Ibs=;
 b=QerGqXrOQwKsp+ir/Ma+vgXJ9Krv6Rwc7eCGj7PV1jl5WuDEFZbkwtpQ+JXdTuPuWTkVEke3DhVqOuq93CGDAvXglLJX7ZghL+jbPHzVG632Z4w8a3GQJ+jwPC5qGBRlbbBMH6yDPEpmtO00R08M+AsB9l3ZzD5LeGGeftWOjXQqxbAGFJNcm9WTn72J5OuyaPN5VRJpPQ/SlXxIJDlErDM6kTHGVnoaqoNYbnejEoaWzO7XBvm/JtPbJrVks5firRcgj/rdEWUdONSmrQPqWGlvq2o7NYYFcrjBGtYVYWTzAOKQh3D8OLbzPADfZTMNq8sdMUHS1SwBAH/x0cGPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA6whvAbHknALXPo49Zej0ng4Nmw1TYfNVp8NHz3Ibs=;
 b=MsZjPQV6JME9C4OKE1xX94kd9t6UWWGRPpBkBcQcjv9wpwJuT4dKR/APTtru7ZjKi9MZVudsXRewae9JjNyBFzFbggkau7ZVnudRGfvpHq8GEaM3whxmvtQhVD0cVavxX6OLn0lyatxRcDE2F1G/hUyfOXHBFDwCXOCaQOc7+5s=
Subject: Re: [PATCH v2] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
To: Juergen Gross <jgross@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20210607130005.5475-1-jgross@suse.com>
 <07fad6f2-3ace-044e-72af-a470f6864c00@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d9251ebe-67e0-2b9e-3031-202f5f27d3c7@citrix.com>
Date: Mon, 7 Jun 2021 14:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <07fad6f2-3ace-044e-72af-a470f6864c00@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08a23083-f339-4929-4ebe-08d929bc7323
X-MS-TrafficTypeDiagnostic: BYAPR03MB4117:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4117559314DF1E638FE28458BA389@BYAPR03MB4117.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBjPLPUSNf3GuWKdp4V/qTU17coLOMzvp5WtcwLfDfp0H6WQlvJC0dQTHrgYYV+V9kP1xJiCquA02S8TaPVKlxjxfbpfDgezfYJTcbc1WMLsCOW0qHV5J8r5UapsrfIS8xJxSTjik6K/YI8u/kIPNKBUIg7GR7G9qv0wgv+MXOgBAAoIr1Hgcw8W2duxV7jcnqY2VbqIWiu47CndAxzoY4Vig0we92evuK5j9Lim6biOhx0f3k0H4Z6xqXCbEQyZsxdhZ9np9q2wH7Y2EdwEHDvZ0RgCOhwv5N1bpFg2uOHz/rUTUb7tovpJCCiDVA0Ukma3VxwztJAKw9ms09ek4XcW23evBqUBWOnEgT6dRaivu+tcYgmMLw520H9hpHFu4pCbxeQHbYC7xp4XQD+GZkzNnCOmo4TmkCGLVFMfh+RMuHcT+2RDThg7h/Iv6SMDoZJwPhgXO7u6GNM32WnMdDnewfouHgPfC3q0FfEt4e4Syot8JZ6TYWuv53PBNhTb5Zgra+6T1cokN47nT0AjIwUdOyttYdlV45nDGGjaJDl2XWm8LRft10oQBh/uypYRJ9N90KuzxzG4nHMB+4E6TDdglqR56caOzBKbPn5g1b22mvjBFfcMbKdWD/1Sq1SOcg4GchgdgeLeQkC86zczsM4iYWO94bSdJuLcQgTYRFYZLtqbPRDY7pEhUWxTqo6F
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(53546011)(54906003)(478600001)(31696002)(6916009)(6486002)(16526019)(5660300002)(2616005)(316002)(26005)(36756003)(8676002)(4326008)(66946007)(66476007)(6666004)(31686004)(66556008)(38100700002)(16576012)(2906002)(86362001)(956004)(186003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXhySk5nbzkxQnAvOU9NcXpEQXJ1ZENQNnZuTG9YaG52Wi9SL2lUMVFHcTNm?=
 =?utf-8?B?bkRpQjlGSk9FdlJlejFmdVU2QmQrYVByTjVjQ25NQWcrb3pLRzJrUTNVSTNM?=
 =?utf-8?B?OFp3d1VoNUdhN0hqMnhtNk94VDk5ZWkzNUR6UmJZay93cDFKNy9TUCthQi9s?=
 =?utf-8?B?VjVJVlZqVUxMMnM1QUFHTE1pNk8xRXFvb0g4MDgxODllQjBad3J5enhpazZp?=
 =?utf-8?B?dnovOXZqZ1JybFp2VHk4bis2KzBEQ25NcTI0U0tyRTBTMUY3ZG5CcVZYdWJs?=
 =?utf-8?B?OGdmMzdTNGFLQlZUOTBjRm9EbFQwT3JNNS90NHRON2VYLzN0cjZxQ1QweGxw?=
 =?utf-8?B?OCtZQmtFT3UxbVdMYUlNd29icnBoUzNDYXBQejl0d0hJdjlCU1VoSk5pQS9C?=
 =?utf-8?B?YWJSL1drU2R3VThmUXlTQkVVTCsvWE5KeWQvZjV5eVMydlNMRDFRbFdHR0Zp?=
 =?utf-8?B?c1dCK2NPYnlvWCs4N3BvZzZ2MVBnOGdFZzhNdUJCWWJuenVjdWphVjYzTktT?=
 =?utf-8?B?UDlDbktDSmJIbml6L2NaZEJrdUtvNVl6eHA2Ym5lRXV5QXZ1OGw5Y1pZWXFS?=
 =?utf-8?B?R0toVjFLRTlsYUpQMnNQLzlLU2wvbWY1djFDbzZPWDZNeEF3elpJb2QxMGVC?=
 =?utf-8?B?dHhEZGI2QTNWU1FrYkNEaDV4Q29SaERQZVJGM0VGbWt2SDV5M1c2S00zdlNJ?=
 =?utf-8?B?dkhKMU93RDNSTGlPbG1QZFhDeUpxeTBzMTIrYTFBd0ZLdy9SUVVKQ1MzaUVp?=
 =?utf-8?B?aFp5d2NCOHZrLzk1ZTJ4U2dZcjFxMkg0TDJGWktNbWN2bEpiMWh0YnVQTVRk?=
 =?utf-8?B?WGZ4bjV3UmFNTlFBTndtbDJBUEdBQUhZeEg3TDBqTGZpdk5vbjZiQVFZRnln?=
 =?utf-8?B?NVpZZkl0MjRtbUF6TEdaM0xHbEg2cGovcW0yM09jMXJNYVZ0aG82bmpRMExZ?=
 =?utf-8?B?U1dxSlQ3SUFqbGk4R0x3cCtmQkc0MUxSSE5iTHF6b3JIUytTR0pZVC9aMTN0?=
 =?utf-8?B?eUtaMHAyRFRGWFFzTk9hZ3IzbnBXRVRMU0lFNmJnUVBNbXA4aDlOS05HRTdh?=
 =?utf-8?B?Zm1USExGN3piVUYvOUliTjB5RnZxNkxQYXFPSE5Za2xDTkhBUnQ0OU15N3NF?=
 =?utf-8?B?WU40UVEvcGhHL0syMUEwU0pSd3JwZmxPTGVMOGUzdm1hNnNtd2FYSU5ybkRp?=
 =?utf-8?B?R1hPNDNjWkVydVJtN2MveDZnUC9XcEdzVDUva2p3SHQ2R0hjN09MWWhXaG9k?=
 =?utf-8?B?UGpZbTJaK0ErSWpabWxQMHMrK2Y1QnhGYjJLbjd3alZTYi9HS0xyenNhMHZt?=
 =?utf-8?B?eUZ6VHJEU3FHTitOMnROZ0Q2dHNpRDFSMk41YWVteFBWcmZhbjBWSkt0VVNP?=
 =?utf-8?B?aGJZVVBhL3NOdEUzWTRYbW1URzZkVVVJSEhoK2Z4SlJORXZwTngrQVFqZE9X?=
 =?utf-8?B?TDV5cE14Y1pHUlh1c3NlRWlqZ3dLVCtJM21iUENLVFQ2U2JJQnJ0Y0pRaSt4?=
 =?utf-8?B?cW5ZNDM5RUlYVzFmeXFHSDkyWVRGM3pMa0xXZUo3ZXRkekFuMEVWa1lmMWNR?=
 =?utf-8?B?TlZCWDdQVzFDNExDZzVxTyt4VU8zSHJFUE1XOW1vVElEa3Bib0hxbk05RkFW?=
 =?utf-8?B?WXo1QWQyNkRNMEpTaEw3Slp0NVJlZVZsRlFBbjhxc3JGNkMvT3RVNXMvQ09J?=
 =?utf-8?B?L1NEYUZRSG5kbkMrdUxnSzFoRmowZk5aUDZpWVQrZ1BwSkY4aU1PZE9ZbVlx?=
 =?utf-8?Q?hqtTo9ePVoDHL4k0ve5LhnRjb3oPK/WnXbQLBK0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a23083-f339-4929-4ebe-08d929bc7323
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 13:59:21.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/1gwH+5mxDN045eJZgeOGv6U5FP48/5RP9Mb0A00URUaQ+v6BzOGVEoJzzJcgrWxRkjROhD8XD+N2yBexVLck5WLRLYD6NivkKSHTEqVFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4117
X-OriginatorOrg: citrix.com

On 07/06/2021 14:04, Jan Beulich wrote:
> On 07.06.2021 15:00, Juergen Gross wrote:
>> --- a/tools/libs/guest/xg_sr_common_x86_pv.c
>> +++ b/tools/libs/guest/xg_sr_common_x86_pv.c
>> @@ -149,27 +149,32 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>>  
>>      ctx->x86.pv.nr_m2p_frames = (M2P_CHUNK_SIZE >> PAGE_SHIFT) * m2p_chunks;
>>  
>> +    if ( ctx->x86.pv.levels == 3 )
>> +    {
> With this opening brace you no longer need ...
>
>>  #ifdef __i386__
>> -    /* 32 bit toolstacks automatically get the compat m2p */
>> -    ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
>> +        /* 32 bit toolstacks automatically get the compat m2p */
>> +        ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
>>  #else
>> -    /* 64 bit toolstacks need to ask Xen specially for it */
>> -    {
> ... this one, and hence you could avoid re-indenting ...
>
>> -        struct xen_machphys_mfn_list xmml = {
>> -            .max_extents = 1,
>> -            .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
>> -        };
>> -
>> -        rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
>> -                          &xmml, sizeof(xmml));
>> -        if ( rc || xmml.nr_extents != 1 )
>> +        /* 64 bit toolstacks need to ask Xen specially for it */
>>          {
>> -            PERROR("Failed to get compat mfn list from Xen");
>> -            rc = -1;
>> -            goto err;
>> +            struct xen_machphys_mfn_list xmml = {
>> +                .max_extents = 1,
>> +                .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
>> +            };
>> +
>> +            rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
>> +                              &xmml, sizeof(xmml));
>> +            if ( rc || xmml.nr_extents != 1 )
>> +            {
>> +                PERROR("Failed to get compat mfn list from Xen");
>> +                rc = -1;
>> +                goto err;
>> +            }
> ... all of this. Preferably with such reduced code churn,
> still/again:

I agree.  I can fix on commit, if you're happy with that.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

