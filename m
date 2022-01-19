Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB96493652
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258759.446023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6K0-000763-QK; Wed, 19 Jan 2022 08:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258759.446023; Wed, 19 Jan 2022 08:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6K0-000744-NM; Wed, 19 Jan 2022 08:28:00 +0000
Received: by outflank-mailman (input) for mailman id 258759;
 Wed, 19 Jan 2022 08:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA6Jz-00073y-B1
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:27:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4d074a6-7901-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 09:27:58 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-KFSXCX37NpGPAzMpBKMpdQ-1; Wed, 19 Jan 2022 09:27:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 08:27:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 08:27:54 +0000
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
X-Inumbo-ID: b4d074a6-7901-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642580877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSG2ZEVFFTEb1Dh+9z06QL4a/OjzOPWshVMJE/WqzNg=;
	b=QnJFPzw1oypZWPJjnrjUhQS0YVnTfWEArQ8zP37YbtOE1QyP8OTNjSl1s4mkt2LL7vkYiu
	kjZoGZs45ejbXYbDfnFbgUQYw79H6v0qNUbhOvQaFCVlRF8DuTs4hROwDtOuTwxAkDLgri
	VSePNFCXxT2grRL9PY/UnbzFcu6P3Uo=
X-MC-Unique: KFSXCX37NpGPAzMpBKMpdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ryxqjoe4+Xm+vduv6GBAbB4ssVdFqo62h1vPrCJy9SJZD7fiDvAS4ZHTADJODxIiV12jBKsbY/KJIGIsmIMRBXbNis3vEdKogWSMfmZVKu42+UecH5fg4SZJllrfjKQNltMXxHs7M4p9j2JDB6CAKAUXWD6XBANm0sJzpQsBFsUENl6Yaee5uczcIRqLzVpYFbrMa1GjAmxrxLB9ylEMnc4eFpgpgGAh7jU8v99JNDtGGszRhmBPxeQOOMt0AuIP+kCRjWlMc1HOtr6wMjAxiV1moeD4ouJKpuq69wGw7d0RA6d+HNCg9jck6IQ+ITwVVLAxv5vbX7lbahmmZfos3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSG2ZEVFFTEb1Dh+9z06QL4a/OjzOPWshVMJE/WqzNg=;
 b=YCJpM1+t0KpH7Gf30VuwZGZ/qQXBlKRRQlXR2yMK7wdXrrftTdmXlqRAlUG9ujR6ciIc5j8JI9pdMvGddQI+flwOSML5inrT+XXa4NdV1w67jw/3aUqTeFtnkhHNNN+PcsFMqfP34yZCTQk9KyIz81zn4SiVIeiDV1LhjQVxRLrOCpIztDz6b5U/5GVgYZom12UQLBffn5bgw0tI0YjmAOX9u1V0L7gwAoj23NLf9YSa2sPB4xYulEi6J1JTzakpcOgoostdOupWNVLqgQsA7xyHRvcuT5EQ9KzjLhixRM/zsohPNTSAOy0JjZPmjYkWlE79u9cGX1aaFqplvGp8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c78a8b70-b677-a14a-2371-d71a562284b1@suse.com>
Date: Wed, 19 Jan 2022 09:27:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: statistical time calibration
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1ea5815b-df22-7884-d28b-bdcc1741e349@suse.com>
In-Reply-To: <1ea5815b-df22-7884-d28b-bdcc1741e349@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0188.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b74160b-ea96-44ea-d5f7-08d9db2596c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574108BDBC9C27311675C910B3599@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LwYS3QctXecf0AqrzSu32ItoP9mcaDSr+AmDln8R+0yS/88BVXbiUTk+xS/SpqTJkkM5/7KblofuvhrGJc10XpEs0pSIC/9ar52H9XGjP88qDw0IoG7gcoMNVuAfmhb/skXgnJceHZMbm0SFbOsexgZiXgxDacGYses1cC+OIOyH/4QnUKW8fneSB6d0LneU6q+rXauiOiSnop8kSqXBo5MEOibADf7nCKxQIyiZ5uBJHfSaohAPB57IuXm4xGuCwL5GsFuPRzXPcNj073fjLFiLjXuhEnZoUTECOqCXGCjfbYxlETY2n5OCcguIkO8B/mM9CQaRyT5N3jpwn0fiMNvLCPT3icuZO4AtFrHCft8ayMtb4gSz86+UPCCMVpVCo7BUaBAn9d/19GQFbqKKy2Q//uDAUfanOqPYX+4h1ws1JRaXXec8Zj/rXJzaS8vNXIJAr2HHxxvaSpMaw+S3+VW14vZbdk16M3ARE5qQC9ghcjBn402YGkf3MvL3d9fErhvlpsXK591YPhMgNtn3SxTf2aGgAlEnBs8e6Inf3dSZEIsnD/Ymj0Hmoxv3TAXhhCjwCjvMjYTfdPFBu7q3cFZ7jj5f7WXwccs7aLkt5kfl0hIclo3a9W1injQPBfjyGkwADc5X7Rn07EdiZ/qNJjRNFuOTwSw9+73+b55pV+6BVYp6CSXbTOP48VeSOyvFIT6xX00ZqArmTzxfiR6OX4HYi5DpGKllH//kBpRWvSmfevuzVN8uY649BFvxJ4Y+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6506007)(53546011)(31696002)(6916009)(31686004)(38100700002)(8936002)(508600001)(26005)(66476007)(4326008)(83380400001)(8676002)(66556008)(66946007)(6486002)(54906003)(5660300002)(3480700007)(186003)(6512007)(7116003)(86362001)(2616005)(2906002)(966005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3MklajIjel+MZP1SZUhMSR6Ibmbv+9L1rpz5xXSMRrwrP55ZuhbtMzFqgH8Korqk8L4CB0m70iEkBz0mm/VauzbyapCoTx/Y7xlMhnR8sDzP3SfOwditV+Ct/kqqnq8hTVf6mzFa6ZA7kmyy++NyegAoPQTLOyu3SugtXxECYJD8ykmFOV63xklIwOKlyGO1WQwTjenbMvLlIqT0RgPgAgRvGjOZFbxWXPQBoNU7HgsZ2V3MDnNlRmz0qVHulYMrqjSWlzSRzprWOOFrnlPW113Jz8BXW1ztz2n8deGCOtVkncT7Jx3CqPHeuxEYJflNptdEuW21ln6q5Z6izxmYVSMI2EA1S8VKjJ/i4gwGLmzthI+3iISq/+bOJ8yx4NL4VgzfO8+pLWaghk2LXtBD2w+Kr1kh26rGp9L/daUilwFya621XRAYFmWD8OsZsPvQ
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b74160b-ea96-44ea-d5f7-08d9db2596c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:27:54.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuDLODtlGDC6v/gXZmo6z+B35+PIW7MzoKn6Z4UPnckP3mcd2RsLHqk+oIeSeJOWoAyj3wHwG7UZYgT2m4Osfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 18.01.2022 16:03, Jan Beulich wrote:
> Hello,
> 
> Roger pointer me to a FreeBSD commit [1] introducing such there. While
> we don't start at 2000ms (but rather at 50), this still looked interesting
> enough to take a closer look. I think I've mostly understood the idea and
> implementation now, with the exception of three things:
> 
> 1) When deciding whether to increment "passes", both variance values have
> an arbitrary value of 4 added to them. There's a sentence about this in
> the earlier (big) comment, but it lacks any justification as to the chosen
> value. What's worse, variance is not a plain number, but a quantity in the
> same units as the base values.

While not relevant for the eventual usage, I'd like to correct myself here:
The unit of variance (and covariance) is the square of the base unit
(assuming, in the covariance case, the units of both values are the same,
as is the case here, where fundamentally both use Hz, and just the scales
may - and typically will - be different). Which ...

> Since typically both clocks will run at
> very difference frequencies, using the same (constant) value here has much
> more of an effect on the lower frequency clock's value than on the higher
> frequency one's.

... means the difference in (relative) effect on the two values is even
more significant.

Jan

> 2) The second of the "important formulas" is nothing I could recall or was
> able to look up. All I could find are somewhat similar, but still
> sufficiently different ones. Perhaps my "introductory statistics" have
> meanwhile been too long ago ... (In this context I'd like to also mention
> that it took me quite a while to prove to myself that the degenerate case
> of, in particular, the first iteration wouldn't lead to an early exit
> from the function.)
> 
> 3) At the bottom of the loop there is some delaying logic, leading to
> later data points coming in closer succession than earlier ones. I'm
> afraid I don't understand the "theoretical risk of aliasing", and hence
> I'm seeing more risks than benefits from this construct.
> 
> Beyond that there are implementation aspects that I'm not happy with,
> like aforementioned delay loop not dealing with a TSC which did start
> from a large "negative" value, and which hence would eventually wrap. Nor
> is the SMI (or other long latency events) aspect being taken care of. But
> any such concern could of course be dealt with as we port over this
> logic, if we decided we want to go that route.
> 
> My main concern is with the goal of reaching accuracy of 1PPM, and the
> loop ending only after a full second (if I got that right) if that
> accuracy cannot be reached. Afaict there's no guarantee that 1PPM is
> reachable. My recent observations suggest that with HPET that's
> feasible (but only barely), but with PMTMR it might be more like 3 or
> more.
> 
> The other slight concern I have, as previously voiced on IRC, is the use
> of floating point here.
> 
> Jan
> 
> [1] https://cgit.freebsd.org/src/commit/?id=c2705ceaeb09d8579661097fd358ffb5defb5624
> 
> 


