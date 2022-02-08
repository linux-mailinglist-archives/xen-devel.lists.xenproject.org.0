Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43314AD869
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 13:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268285.462085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHPmb-0006hg-LV; Tue, 08 Feb 2022 12:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268285.462085; Tue, 08 Feb 2022 12:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHPmb-0006fH-IY; Tue, 08 Feb 2022 12:39:45 +0000
Received: by outflank-mailman (input) for mailman id 268285;
 Tue, 08 Feb 2022 12:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHPmZ-0006f9-E1
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 12:39:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ff12781-88dc-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 13:39:42 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-_kk5Ur3ePym03TNQ-Kjjqw-1; Tue, 08 Feb 2022 13:39:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 12:39:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 12:39:38 +0000
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
X-Inumbo-ID: 2ff12781-88dc-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644323981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUg4Z+18MWNBPyCHUl0bmliqiMHtKhewRrEatLOvplk=;
	b=bGIX17ay69tHPkvciXrWt8jLlrlvv2yGKBTrLILygqHzceereTsUsayb3++HVKEEoNQFd+
	sA83ncyq7ZvCe9Y4T8gsufR3eTO6D7D7rZrllmeBWQ1qMKJ7F78qs20gjqPFFDn9pOki0A
	igrOnaw8RozN0Q4qU2+CJrbrN9mzySQ=
X-MC-Unique: _kk5Ur3ePym03TNQ-Kjjqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI6QCqN9pUvBijcnC54ap1bQ14vc5XyuGPCyqY9M2iC9VPkBKxjWWEgzUWnf2LBUb2Wl54bgCJYI6ZET6IsP04DIAh7KRnUW6m/wk1NIHmYVo9druWGYGNOIaQMH2SNHZhIce5IjhHapiyuvjcjLYgVneB26XPtQDr1ZE4Kkp0gCd8gdBSY/4pEEoHwtgAOgdI8efSNG96UP2cHXM+/epEQzQjXFN0TQDxoNhfW8n5buyd9+62L5swyAiQe4L84SuEFMn6fJDps8ELgaX4QHSKjMNUP94xQR8wz6cc6RXoucZrhGmp0Ef9DFwwTR2yYp7YWBS73k6k+3lsyIfaSOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCqdjoxFrAnSbptkGHXt0/OVQ7dmwSJ7vwG0LLge2lI=;
 b=FPM8W+TUXLgfKMbfUgEd/Pj/voXgBY9xc77xXzpKAdDFO7nfTWyGms2HVdXedYEPfWbGwQt+k7TfVwVACD2E7StJK2aOZe/7zgpKOlORvXL8rUSgnTuxGZkwQQEao+XVXohKj65npJDSe08b1EYwuFvBdCrCXNGP6ATmk+mtOKaSxTO7uPbpDMGKwhzv+dyXFlUCUmnTBlZBNO0e3olYfBqbz9kwKux9MmYHRGrIOqvwiN1+ElEoPHgmXgmaz9hpSlza0Kmq+1Nb3FjDo8AHxJ9xCK05PQtSw+n6neuumkscIr7DaUki9jvrdQLkHvYwhAAbKx0eLKc7C05234uZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a988a920-ed19-171a-ec60-6b32e8b2f593@suse.com>
Date: Tue, 8 Feb 2022 13:39:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] xen/public: add comment to struct
 xen_mem_acquire_resource
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220208074230.7901-1-jgross@suse.com>
 <ed7424c3-e54c-4c65-03c6-57f9ddd182bc@citrix.com>
 <bcdb29f3-164c-03ea-1b48-4328f75778b1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bcdb29f3-164c-03ea-1b48-4328f75778b1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0315.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0c9fa9-c68c-48e2-bf0b-08d9eb0011c9
X-MS-TrafficTypeDiagnostic: DB7PR04MB4090:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4090D7C88E5DF334CF91ECACB32D9@DB7PR04MB4090.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EEKm7vx1ICYA6QyZgf999qKS2yzQ1Mw2Nt6iDvlMEtDnhEtOBOfwdiVIk1HUyu0Lq7kuLIwG10EZUsqlC9Bu/9JttXcRaZB8o6X7WM+IyR8jwRFlPo3hUokHIzm5YnQk0qikaMAhBMliAARkj4fi1O1F0ENGBuB4m1JrU/3km/gs5nFSm990+vOq3uZ3BhmWEi1mKdf3FuMgtyozrJub7fWARfJwdwmO0fUe/GJ9DBFebsFkX/M9D5D/i5zJTcnLUta+HZ6as38noP8lsu01eT8rRqAf01tWxuPhujEkfXiIR3xe14tHe6QXy4waJq1m3GstujWJ7MCrrCLS1/lOzEIHSCWKAOZRJpEpmmsyPYryb+bfsKL2FYvEtctwYL144C6OwdXEYT5xZyCrIDv2jn65GEv5oiLWb2vN3UbePK08uNTePgX7QKiSQGbIqVyGLodCktvEScjnsfttYUNxPMPpppcYsDorJvp4fI9KwPdydTzzM7oS1ZN3tIUq5Y/V2j1jiT4IzmYKoIxWNFvrYbmPVhbdnLmisYxkqZu8UUrIxnTd1yxHa0il3qkVq0omu/93+oGGPpgKny8Wi7CLQtt2ZHMq6bJ7QSRHuK9MrAvY5kRDlQoLsBbX5/5HK5zR8KVSGjH7T1pbQasl/JqmcU4S1DiQQqMk8YuNhNakfOckTwcUsagaTex9TP7iotkBPMPT7BOW+kPLy5uieGuNTI2H+db+9xhkMAWq2ZHThdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(36756003)(6486002)(26005)(186003)(38100700002)(5660300002)(2616005)(4326008)(6862004)(8676002)(6506007)(508600001)(53546011)(66946007)(66476007)(2906002)(66556008)(37006003)(54906003)(6636002)(86362001)(31696002)(6666004)(8936002)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WgXt1NLtQcDdXz9L4Oj2afdWpMpL77GBL9HNnYD9fSYo2iLgdAlSVotKVc//?=
 =?us-ascii?Q?0ZY0/uw+0QlYbvfU/IdkNKyXxBJM632A0wHZ+RRuFmlCmImSaVFEbgb0/jpH?=
 =?us-ascii?Q?AMcepJAcYG5h7p0nTz8jmI6K9YpvSuwKih16klE+DbzamBEoWpvUNI2U+YOz?=
 =?us-ascii?Q?RlJkcUftqTz7icr9/dbKXiYL2giBXCvPba72jgevP95pVAuUYTiY3h+9kZuS?=
 =?us-ascii?Q?zWyhfMBfffg62eh3lmIxQ42Tx+2ejRDdA98cvzhbPXummMMoOsjmE3SIKSHq?=
 =?us-ascii?Q?h0hx6i9PJUBn/q20K+2QJNNlSGxUMY/NTRr5sjYUbf0d82iI8ksO6HdAyclK?=
 =?us-ascii?Q?6n8BNvMGlYVnwUh61LWF3qJYseyrNf9w0WJ+fv9SbV6S1B9kc089f6hubnVz?=
 =?us-ascii?Q?YEu1Y5swX9MOKXPKLagl/qWldP9ENoihdAG66cnUIgtZnmVvWTZgb+MPEoEW?=
 =?us-ascii?Q?zKjXF6cRjYiDtwI9716YTpJ6SuliwGpX8zXe0aE4ETX5qSYeuDQjfcALSooX?=
 =?us-ascii?Q?Zuob//RU9CZ1gCeGLDi5J8JfcRy6TkzcR+q/cuQagd3Rz07LSOtLEJJYMVYB?=
 =?us-ascii?Q?li3p+xLBQMH52ilE76WrbB5G0J9d4pGPMvE5RCvDIc4GRdBI4Mw1CfceEzdJ?=
 =?us-ascii?Q?F7meOdn8+1K73gm9EPzsoR2aIgnyB+LZJxpmy5T9Eq/WY3WsogNpdxgu1N10?=
 =?us-ascii?Q?HiRVT+kmCM4BDHi1Ukudzzj9dJ72T6ukA+Bst0ZbFhRiTLQBCL2/4f6yoWuJ?=
 =?us-ascii?Q?D/Ryv3DbS6HM7Ce1kPSua8dcisYx8EGHHb/2OMqLXTNCmrtTuixn3dxQ00gC?=
 =?us-ascii?Q?dj0sPB9WIlhW3HKaQoCQ5Cnj5n7TL3epEpxcnzfXoWHFS9bbfSNstEUcqsi9?=
 =?us-ascii?Q?IQ+tljKFwFcsOFDQ0u9y53n/KLNxa3lKyZPRcP3xzXRuR13iEstU55Vb8x7v?=
 =?us-ascii?Q?+1YkvjaHVBBku9X1IrXKV0Q8IxKiQna/AH+Y35cV4CX8wI/dOwBhhBrLPrZf?=
 =?us-ascii?Q?vGJ0qp6nOwEfQSIFLoswi9u5/1ieHXNx5+ckPybXyGCtkRrXV1bxUVCujp/F?=
 =?us-ascii?Q?X+1PS5JcmLeNxMD35nWTCNneD+v4FSpt9L0SH1Qqj/ETy0PgoAaj/+BfIlc6?=
 =?us-ascii?Q?PztBLDxYO49NJqriFW+7YfwM8L3TEx6BjPIBL2VSh73XVoj3+JLeb8IjVAUR?=
 =?us-ascii?Q?jlZXR4Y4EEATCkV9XG1kbF/yZq8JOmhM+TgcBXyFRm5aTRvmNkJFIb2L8FAR?=
 =?us-ascii?Q?S+316FyD9RQMkWawuPdhC4MbvoCD6bc2N6IkjeSHdJzesXMzmRPt4YGLS1k5?=
 =?us-ascii?Q?c1QxGW6m6/y4Wa6LUiioEB8rMXJY5I1z3xSKAHt8nHIiganfT5nddegb9lQ9?=
 =?us-ascii?Q?PN/Xtvuq/9A63w1qj/klmt0wxNVXKH6JjAVARh68YhjlcRkN0fGyuGiSBWDU?=
 =?us-ascii?Q?BDLiyb1ig4Hb/v/ebVriSqfQjIX40m6wPxlJlhOrY7o0YRm257dkEmsXtdxz?=
 =?us-ascii?Q?cjC0/IAFnhCMqQ6BlPMab6dt/aDvurQAJ49BPrbrGnLDENfPnwaOh4SwU0t0?=
 =?us-ascii?Q?o6+yX9sMcpIg4UlwKcTIna3L4jmjeOkmjGI8rWj5WTdyPKERnOyc/LYCZdnn?=
 =?us-ascii?Q?fPNCjtp7gt6GsmNW7LmdKp4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0c9fa9-c68c-48e2-bf0b-08d9eb0011c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:39:38.3097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZu+DrflvDFjKQ3J+B0DKlk8hjIkmLz7SOwoguzwHekBws+PQVwoBGvRcyZlHk8BJNNbN8dVor8xUrdJrHNR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090

On 08.02.2022 13:22, Juergen Gross wrote:
> On 08.02.22 12:55, Andrew Cooper wrote:
>> On 08/02/2022 07:42, Juergen Gross wrote:
>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -662,6 +662,11 @@ struct xen_mem_acquire_resource {
>>>        * two calls.
>>>        */
>>>       uint32_t nr_frames;
>>> +    /*
>>> +     * Padding field, must be zero on input.
>>> +     * The lowest bit was named XENMEM_rsrc_acq_caller_owned in a prev=
ious
>>> +     * version and should not be reused in future.
>>
>> s/should/will/.=C2=A0 This is a statement of how Xen shall behave.
>=20
> Okay.
>=20
>> I think it's also worth somehow fitting in that it's an output only
>> bit.=C2=A0 It will be important when inevitably we end up changing this =
back
>> to being a flags field when we need to extend the hypercall.
>=20
> Okay.
>=20
> In the end the bit only needs to be reserved, if pad _is_ zero on input.
> So the correct way to phrase it would be:
>=20
> /*
>   * Padding field, must be zero on input.
>   * In a previous version this was an output field with the lowest
>   * bit named XENMEM_rsrc_acq_caller_owned. Future versions of this
>   * interface will not reuse this bit with the field being zero on
>   * input.
>   */
>=20
> Is this fine with you?

FWIW it is at least fine with me this way.

Jan


