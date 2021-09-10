Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC5406771
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 09:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184096.332644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOaVr-00077i-FR; Fri, 10 Sep 2021 06:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184096.332644; Fri, 10 Sep 2021 06:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOaVr-00075X-CE; Fri, 10 Sep 2021 06:59:51 +0000
Received: by outflank-mailman (input) for mailman id 184096;
 Fri, 10 Sep 2021 06:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOaVq-00075R-HJ
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 06:59:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea9d2f41-6f98-4981-9f2a-7945fb07a15a;
 Fri, 10 Sep 2021 06:59:49 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-scd2QKGiOOuiYiN-6B-nsg-1; Fri, 10 Sep 2021 08:59:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 06:59:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 06:59:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 06:59:44 +0000
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
X-Inumbo-ID: ea9d2f41-6f98-4981-9f2a-7945fb07a15a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631257188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCf55x9SnfeNjoh0lPU2nefNa0hUu7q46T6aVLEjcOM=;
	b=X/8ti74CPB8BiLheasanw7RIMK59KD3DbbPAn73KAJKqLNdB0dEtlvoOFWncqTGESxIVoS
	0OQq+ZRHeNMMM4UBNtDRprOAX0PcPh+5r3SOsvpJxv8oSxn//d0N5/kPeXUCShNOWIxudl
	pqJC8gyNKv0H2t4vaiuPkgZ8vJmxeXk=
X-MC-Unique: scd2QKGiOOuiYiN-6B-nsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ho4Z02Gs+I05vsATkC0xAtOD9bLqS2UOH31G5zNi4vh/XVO6mlRUxjLDNSR+mIeTSKHmBIItux8oHFMciKnPZYeiaHTk/FmJQxZn14Wz/ZpCUz+2InvJcKDv2uLA/giZ6J6dBinMVR4Pk4P9qrFVdQSnSa0vh6NvCD5itgupb7pBCr8bL0U1v+YOKKykDJoH4H7a4gTC1/Ln3DuAk0wKpeAfKAwVpkrYrzF7kZjY+XN/+HqR5q53yV+vZbO5RnXF59fMx5x11rFmG8MVfGF04t344HtSlrgh+uhRJXIbxzjt7Y2tEtJrUW/ogaeH1W5ZW9ezxOkoBYWAW9lHHB8DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=y94f08PmpbGymxwcg2LlCnG9x+YXIiqERiRQjkQp8sQ=;
 b=T1KZ7AzUeK7gN0rhkqg5tlZGMqpja1hqj6MFNwqXWdOohZZjDCQ84GVtGTIU9g3hy3p3Kw0c9q2zVSNOI4W8F5PKgyP4wXgYq9ePWsDZjsCfG0ATwjl8FVaztaMbVlHA6Y01JMleXCitpFkSje/YGX2cW39vSglZfGrxxXIsaWPM3B8tF+5ujz5McDZN0hfPvPlLZ6cqRUnqLOD3Q2etvsnBE2rt3ufeJpATRrlaYHnVY15a15TMkZ5GxGqNVtcLQRIvUxKm6b5SMRH1TwQnAK3s+EHaqAj/ImtVW5cNA2rVLqB54YPxoRQhOlHT1+7NatRfRkxowzmx86rdCDKa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: correct asm() constraints when dealing with
 immediate selector values
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <87278164-2395-1fb4-7569-9151d0151e8a@suse.com>
 <0800289d-7744-2c77-b369-707f4947595b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <adca3cf8-d9fd-f6b5-9754-754df4c06787@suse.com>
Date: Fri, 10 Sep 2021 08:59:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0800289d-7744-2c77-b369-707f4947595b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0105.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae56a255-a609-4314-ab47-08d974289243
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260764436A80707E5260A065B3D69@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gWibJ++nPUS+Vo2FsxJZfaSrdAByAL5dmyT5yKggzraBrExykc6PYw+uJgf15wJp46nzN06CQk9pbrLbhRGC9hA2gXdmVaK3TCcgL1ovR4Fsptqr3MTNySBca0e8TWD7dqyM5aPnRwJxOy4gA/mo4nsTjNmssCnGO09iEbMR7HaZbn8VwXwKF6sXnXQCQibi0L/y9Jozxl8GvRorzkmhooxV6oipd/oztywA0rxBnkQeNplu9OfNj2M+2wVY0OqMPbqMb8sGpV7v709YlhNOHFHekI5SJWDsoxrUr9x+tLrBAWFJXMBmweOV/Mfhov3LZ0J72WIXrPrVwOI7QWbpGbwPCC8ZTrbcTZZNPWp21LV5V+rMMhnQNFSPnqgClD+48bID8/8lc0P5eO9L+zQOUAUgC11IGy3ECqWZxVv/mNbOxY+9GLgkE8eQ1WTOxiBANNhuGJsUU+C9fOMZoHzCNIVsWmE7cIvpEGhm03qfF2hnAIj4fcfgYbeKYTKv+o2IBAURykIU9UdBn5Oc2YZF8cYFDv9kDLOd8Ex3X8u7gnuP0Vgnll3KL9qJLhWFQRbMh+9/hy+GX85vHfjqrB+9LOXL8NBKS7Q0xKNgM3QWwOrPlXt8fwqaElb47vA25ytQ8teHzr1SaxdyK08l1E9wgJfRyMLWQLGzF45C/asQfvL3WfOnS6iopOQhJtaBci06/AWE3Wax2gy1i6hZA/eZHeyl7nIM7eGWdHmAS0Bot5Tit18KupVy1kyoTBmDwOrE5Gjfm+XyfwbTzfURrcUSUNZlVRRzrD2dkHG54ZHhufJ+w0tL7EHv2cgUKzrNCI8RUkzA4xFGd0lb/E+7ku7GWzP/Cg850pRjH4WMaTp5IS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(66946007)(66476007)(8936002)(8676002)(26005)(5660300002)(31696002)(38100700002)(86362001)(6486002)(6916009)(2616005)(956004)(66556008)(478600001)(4326008)(316002)(2906002)(966005)(186003)(83380400001)(36756003)(31686004)(16576012)(54906003)(53546011)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?piCv0TaJxxYWwJF2Z9tf2Q/kjRLQ7qF2jFosMsmRavHUgJXKyPT4YEcAo+3c?=
 =?us-ascii?Q?aEeAjf3NqcZ4XruIt2r79oNz1qE8wCOeVzSDcCa56AZuEGlx8cDeqVK/ZGrU?=
 =?us-ascii?Q?h+e5RFDKtFTNBmcpOsBJHW0WDTKik0E1TEO5XMvNxE7TqmvoxpETbIVdjoOX?=
 =?us-ascii?Q?NApUGr6hDQwv6/z6acC/lmmiJjO8KTM7xFEgwnDDyjBo4JDSFXDoSJLEDcCy?=
 =?us-ascii?Q?AFlMkrF9muM5XrPC8gUON+o3hly2n24ESqnilyaAXdqwW7ZB2TNMUNoMoyRm?=
 =?us-ascii?Q?KpJ1f6nK0AfbLTO43ARQeIs8d6gMsaMNWKmAfPklm6ES3tCbGZfVXFwVv3ra?=
 =?us-ascii?Q?COQyV2fU0El/VE9nSPdYZOduhN8BrPM4D8HHANRyFims7P7FH9xv8Px4oK6V?=
 =?us-ascii?Q?90SBj+lfxji77cvVk38Y/BjEUOBYmgb5d9x3df8QXMIGSNGxHsoU3utU+jjj?=
 =?us-ascii?Q?eFX4+k5/fijkzaV9bWFdnpDciFTVfFN6alrMhQw6CQcDvl1zihdzwYZImSXs?=
 =?us-ascii?Q?Mv+H4BqWeYCuGcpAxGobJeM+D5zLidImu5s488c29wC98YwxoFKiHe2qDeuL?=
 =?us-ascii?Q?5ImdD8bSLTzrZ+SsquPMUL1yJY2iVvq5RfqsU30ZBbHLshRP0Ogawqy9qpuV?=
 =?us-ascii?Q?GmeTTCksuj12Y9Ve9n/7NSlaNYmtITqLi2p+V36MLhfSD9jx+eNmycELOxOk?=
 =?us-ascii?Q?Zi9856r2UxqWV47+Ai3QrpGgwYJ019UahCxt8YAEGYR555bGXH2JJB/F3BqH?=
 =?us-ascii?Q?mAb0sXmjFcrccQV6QNzDGQkOrFdZMWf4gvwff9kJCFlmr5mG4S2oEJWPo5Nv?=
 =?us-ascii?Q?LU78gRyrBicaTjhHM+wTKpv/ZYoG+GV792l/T0FrZa2AcmQW8Jz2Di2r5D+6?=
 =?us-ascii?Q?u5qOizXUeiY9BJ1vJToPKUEQ4aLSCwgD4vaYh+DQir6pyvhBuPKuuge9DFWR?=
 =?us-ascii?Q?bsQqTJnBFJ95Ms+AmEb9G4Usa/okRDGLFczZKkDwqG4uGPfCtZN4eyCrhGAm?=
 =?us-ascii?Q?c4ktQmtJNQvU+KSotPgnj72PHRBEZGRXTUf4V0hGshcTFWBXJFwbO+xFR6n6?=
 =?us-ascii?Q?dLHQC3WUvMWv9uW0qwuevrz/RsXsch3e4ofwQHDbumf3zXf7cBMFX58dlez3?=
 =?us-ascii?Q?Vk3DIXxoASzOLAIZSVqAEA4PokTgVpqJi7KrXTW2YSDKlido7NIG9X5uAR/y?=
 =?us-ascii?Q?+ib/tkvnAYbd03u21qKSj1MBU+becJg/O9HF16OmQOKU8KV2FtJYCfiZRv8G?=
 =?us-ascii?Q?lb/255fluAjwgWKHDHaiifHrml6TvVZG6ndkWLijTx6I3XKR2YcP8vKmrhb5?=
 =?us-ascii?Q?Ni+WGwvdeb/AqH5Jo0N6Josa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae56a255-a609-4314-ab47-08d974289243
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 06:59:45.1727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g62zdnffQxUE9TldUu0xFDd3l2JJig66f0PjjB4iusi8FEx0LL0VykkTO6XnjB8gizghA6V02915zJ9P8CDpxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 09.09.2021 21:31, Andrew Cooper wrote:
> On 09/09/2021 15:56, Jan Beulich wrote:
>> asm() constraints need to fit both the intended insn(s) which the
>> respective operands are going to be used with as well as the actual kind
>> of value specified. "m" (alone) together with a constant, however, leads
>> to gcc saying
>>
>> error: memory input <N> is not directly addressable
>>
>> while clang complains
>>
>> error: invalid lvalue in asm input for constraint 'm'
>>
>> And rightly so - in order to access a memory operand, an address needs
>> to be specified to the insn. In some cases it might be possible for a
>> compiler to synthesize a memory operand holding the requested constant,
>> but I think any solution there would have sharp edges.
>=20
> It's precisely what happens in the other uses of constants which you
> haven't adjusted below.=C2=A0 Constants are fine if being propagated into=
 a
> static inline which has properly typed parameters.
>=20
> Or are you saying automatic spilling when a width isn't necessarily known=
?
>=20
>> If "m" alone doesn't work with constants, it is at best pointless (and
>> perhaps misleading or even risky - the compiler might decide to actually
>> pick "m" and not try very hard to find a suitable register) to specify
>> it alongside "r".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I'm slightly surprised you didn't spot and comment about what Clang does
> with this.
>=20
> https://godbolt.org/z/M4nrerrWM
>=20
> For "rm" (0), clang really does spill the constant into a global and
> generate a rip-relative mov to fs, which is especially funny considering
> the rejection of "m" as a constraint.
>=20
> Clang even spills "rm" (local) into a global, while "m" (local) does
> come from the stack.

Which leads to a lack of diagnosing bad code, in e.g.:

void movq(unsigned val) {
//	asm volatile ( "movq %0, %%xmm0" :: "r" (0) );
//	asm volatile ( "movq %0, %%xmm0" :: "m" (0) );
	asm volatile ( "movq %0, %%xmm0" :: "rm" (0) );
}

The "r" variant gets diagnosed (at the assembly stage, as a 32-bit GPR
is invalid as an operand to MOVQ). The "rm" variant gets compiled to a
64-bit memory access of a 32-bit memory location.

Jan


