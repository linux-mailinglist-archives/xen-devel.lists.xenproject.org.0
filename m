Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0D4541B2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 08:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226602.391619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFDg-0005t8-QM; Wed, 17 Nov 2021 07:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226602.391619; Wed, 17 Nov 2021 07:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnFDg-0005rL-Mr; Wed, 17 Nov 2021 07:19:00 +0000
Received: by outflank-mailman (input) for mailman id 226602;
 Wed, 17 Nov 2021 07:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnFDf-0005rF-Hg
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 07:18:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1421771-4776-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 08:18:58 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-CxDpRj0RNWOpkpOogJj9aw-1; Wed, 17 Nov 2021 08:18:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 07:18:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 07:18:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0053.eurprd05.prod.outlook.com (2603:10a6:20b:489::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 07:18:47 +0000
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
X-Inumbo-ID: a1421771-4776-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637133537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ma1hzlFtHGxNvdfFTwmm7EgNAItC/xExQ2/dRnNOFv4=;
	b=lqXpdnoCiXmmueNp76ZjDsmlHIsRswJ3CCDTr7FxW4CioKruCxXKUNgWFcKb56R+ZPMq9R
	GcAH3sCGN85eXwmvx2ygzRMys2YL8Lep6UiwusuJ02QCeKm0NgClWKlQ8ErNq1KeTcOmMa
	5MQDLH/EnddFfbMzfRoLG+5d9FhMetQ=
X-MC-Unique: CxDpRj0RNWOpkpOogJj9aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUJNXT3PPS5kWJ7inRZUFssIFiO4sBbnbNThzGFVKehkwD5wEeC08Z3TlYYRKlgN/3C240YXhIelak1K8ChckEx4G6C6r+L0Z4knjNCdQFXCEWQJHd7+NETuieE4jfMopwO7FZpYUJsDfGA5d5JjwwrHJVrYiIVjqQGQRGsXLrTVrIRqL74IBt6y6arvo+xOW97T1CuMRavElbvCE49linLiGaUaG8/ZL3Bjs1NpntDnafJ46G1LN1kC5owdgxpF/l7VpJyOGSZr/SS5Ej06SvzpraD6lTw7LPHRJaAMnJBAfh0cmSjMyFojpL5C7xX9iGyiVBrS9ArnQBGyNJoP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma1hzlFtHGxNvdfFTwmm7EgNAItC/xExQ2/dRnNOFv4=;
 b=eTsefedmgvj0zCZWssUrJpSzT5dcxCp0vi3MrHMBfZjoYoYkwhvWL2Z7qpiN6nF8WKMYCw0pHu+YhSYReY4294EQIHBUYH8Dlx0AJXciWUvYXVsJ29ZX3wUsbOdaz4moZdMS824+Y8BK2oUeqw1aQqrOXftviC3z/U6g30P3Ltj1StbOPMZel5YR0l0h5nszDpe/OWNqt5zbRdHzKfTsou5aSqRib1bZJOuMWKvzgWRs77WgwEbOXAjQyb31jhTYl549dC33f7TTuamMeRjRlE6MPKKjOChQKrsWE/SurITBJ/WUVPETnpNW9oMPeYKXUT4KCCJyjOLWNOWm1eiF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34522fb0-6b39-e563-49a4-a04145104bd0@suse.com>
Date: Wed, 17 Nov 2021 08:18:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 0/4] gnttab: fallout/improvements from max
 version
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211115121741.3719-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211115121741.3719-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0053.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ce6b086-af4e-4b22-2b6b-08d9a99a8015
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41901EF006806F30F6DD49EAB39A9@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O0mCD8EBNadw6zD0qRkgALJdjPR/Xdi5mbAU78N66wl2nJh7z+KT9P3vRQ6sscdgsCxnShxp7wJoyU/B/KTctUiK0BRC8R2hyDw4ciYPYNunelR+tclH+i094tXtHdj0znXQgPZsWSwcZlPBFMQDgSAbNptl675EJf8gDF6aWs4KL0xg/Bbghi8tGQ4ChgnUtSd4UAxefZbX7dcSZgXgO7Ia4uKaRHr7JyfxTRvdFEHiiY1o3rwFnd9Hqd7d7rqjWBiBJhQBPEeDLl3GXxy4B8crLcsdJK0AtI+FSMNLpImlh0YLxakUpvqpcYFX6x0bLg88RaKDX3O3dmnC2+/nstSB7JH0rHm5nf1C4aQyTGS+iKenIpPGt5j63i9F53fYXxKeyZRDhVdEe91IPFNXFtx+mqWT06hF0+q516IJtsRF/FDahLCzc3mopp7SCjMgH8sEGU+WB5kgGX7bTt/LzTQu7zwhRea/7H1eHLITlW3/1WN+AlScXcy+tE927kk+BTXBgsuFiED032LfzOeoeAOeNcC01VGNAwCGq9IDLOZzD6j/viCC4lBWN2DZKPmRCXykLc013uFwCJyaLQaGjb1gvJOC7usqT4Xg9tfSFHWfr9LimvtePt+JI2EX0KfScaTdwh8ugFX/hXDFJ9ktlmwlAMw1kXsLyNSYq2baKiV9x+nJd3RBUeIsOwNL0ljDjTvfPnSIe3LPyj6V9/1aVFRsEwh4JRgjbY5GZ7gBCS8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2906002)(53546011)(36756003)(26005)(4326008)(316002)(6486002)(4744005)(38100700002)(110136005)(7416002)(31696002)(186003)(66476007)(66946007)(66556008)(16576012)(54906003)(31686004)(2616005)(956004)(5660300002)(8936002)(8676002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkI0TDBYc0tSYlVJYkhYekFaMm1qVVQvTVFxSTd6MnI1QTVKaWxXTmFpRmJC?=
 =?utf-8?B?ZmsvNlhiR0ZGSHI0Q1FWNFBZcVdBOEhOengwNGUrQXpkb3kwZjNJSWJRcHZz?=
 =?utf-8?B?bHVmVUw5QzFSSTAvaEZWbW5UeFEvaVZoQVFjS21rbXF5WTl1cEVTQkRNNTdh?=
 =?utf-8?B?SjllRytHQlR5eG5ERFhoS3NnNjE3T1VaQk53eStVVlA2dmJwWkFsV2FZRWx3?=
 =?utf-8?B?d2RrSERiM2pKRmUrQjZHakl1aXU2V2VDL2VobVYzemJ3YU9SYVFHeWVQNUcx?=
 =?utf-8?B?WlBNeml6N091WWZhSEpsL1lVUDZDYTZ0enNXY2ZRR2hTNVZmcUhMbDdZZ2hh?=
 =?utf-8?B?ZGRMaTJaK2NlRWlZdW5BcEF1RTJvTXhhWkpEeTl4VXJ5NEpBcnlCZnFjbndS?=
 =?utf-8?B?Wml0ME5rUzlJUmYrYWg3VGZ4OGxYcUx1TmxVUFpBRXREcU81L3JGU1cxamt6?=
 =?utf-8?B?UWk3bm8vT0NxaFpMRTF6K29EQit0b2JpZmFSY1pzTU15QVl3ZSswT3FlSFBI?=
 =?utf-8?B?bzNBMzhSTC9jdTdBNHBqcUJNM0JnczVuZjJMbXBtMzY3K0cxeXB3QnpVUkND?=
 =?utf-8?B?OXhGbUVHcW9TZ0RHZFNBT1Bnc0FwaE1sbVBZZ0kwUk1VOVFOdURnaDVMRXl4?=
 =?utf-8?B?d2JVeXh4ZTdQRzdPcHpySHh6aGN3NTZYSGErUVNlazdkcG14THRQUkxEVzZi?=
 =?utf-8?B?QnAzY1NrSjYxTytKYkxIQ0lBcnVpTU9sbWtJdHdSWWxzTi84T2VGU052UEVS?=
 =?utf-8?B?c3ExcUtwcDFvYksrYm85RGxjSCs3Z2FjTG9FTUxPVW1JZFF6QStXM1V3Y2Vv?=
 =?utf-8?B?NXZFeXlwaW9JdG9RMDJwNk1TZVVIdE1VNTZRQzh6ZFNRbkpyVUVnUWo4RXFz?=
 =?utf-8?B?UGRzKzBFSFJBdnFVSTNCY3Urek1BRXUxZlYvMWZpZytZcldFSS9NcHVyLy9V?=
 =?utf-8?B?OEs4TWhYUXhiK2w5Zk8xUWNnWitTekpTOGFKVlJ6VmV1SjNiQUxUS2psNUkx?=
 =?utf-8?B?UlM3SjgwdGlvRFB4MGRpTkhIY1o4Y25XVU9scDF5U3lINmZnemcwdHRJSmVC?=
 =?utf-8?B?ZDNDMy8yWmRNeDBQb083UTJwVlZ1NXlDa2FIOC9PTVllUGNjNFE3dlIzK09X?=
 =?utf-8?B?VmdGZkJXQURTOW55eHZEL243cm1HZnZrR0Nyc0pBaW01dFVXNFl6YzR6VzNP?=
 =?utf-8?B?RzZFSm56MUUwVi9LTExpNU5oUDl6emR5Y0hsQ01zU1FPYW5QK3JSbnRrR1Rt?=
 =?utf-8?B?YlZUeHlZQW1DUFRGdmJyMXFzdHdLQVdzZWtZY3B2SWIyVWU4SGhNdGl2OUwr?=
 =?utf-8?B?T3ppSFVDOVE3NmM0VktWQm5TVU81ZTcxS1VhN3drVjZWaTRzdWluWlJ2MXQy?=
 =?utf-8?B?SlpFemk0TTAvYXZqRU5BaTdCcUh5blVoeGZjRk1PT1lrNkc1ajVoS1ZRT2k4?=
 =?utf-8?B?R1FZZHpDaDY2RUtJQlJ2Vno0UzVOZUxuWVlncGc1RmwxS0g4NFBCUjlSUGF0?=
 =?utf-8?B?aGk1a2MrS2E3VTB6T0loMTFKV1Zpajkwb0NYbFFLTmFNRGVBVFNRZ1JJSlBQ?=
 =?utf-8?B?ZjRHdHVCTDUzaVB5eWd4ZCsrYmwxR2U1OW1OaldJbEZrZ1h1aWNXVTVNU2ZB?=
 =?utf-8?B?dFEyend4eUgwVFhqRGZiTTRnNXpBcURoeUNQREd1emZQT3dnWGV2N3k2QUFI?=
 =?utf-8?B?QTRyRzVDbnQ5MHFCRnZVcUMzM2JzVFl0VjRERHRGYmhrbTFXZHA2NnZtMTdz?=
 =?utf-8?B?NE1vTkxldWo3M2RIRnEzaVlqdFVpcFcvWmFSOUNURW5VQzUzcHB3aERHZHNV?=
 =?utf-8?B?aVYyeng3bFdrTXprZzhzR0NLQmRrdDJDcXpvNTA4VHY5SFg3SllUOGdvaW5x?=
 =?utf-8?B?SmZOR203SjR4MUZob0dtYjNJY0FIYlUyaGg5RnFUWUdDcWZDQnZSV3NTSU55?=
 =?utf-8?B?T05xR2lELzcwWFp6V0F1TXNHNXRKWFU5R25xcERzdTRNU0UydkQyWnp5VHIx?=
 =?utf-8?B?RzByT0VDZlNrTFNrb0xNdHoyRmlFc202RERyWFV2QlFKWkxXcktjOFVSZXln?=
 =?utf-8?B?U2YwZUZYNGJaS29uRG92c01JOEZOZFR4UmtWaFlaZVE1RHVjMlNvU1MycGpl?=
 =?utf-8?B?MXpOZmtvSGNzMUxwVm11eHV6UGlIWEhwNTU4WXhXSjB0UGVURHI0QUd1ay9X?=
 =?utf-8?Q?IXtfA6GjuCyCysDiNPYqtUQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce6b086-af4e-4b22-2b6b-08d9a99a8015
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:18:48.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIQ6pTYdJNJ/570ZZcFPMjvKFlMEcElcm9ZGytK1jlBv+BLclsbceI/icuRtqKJrvIDoUS0rJl0U+j1tFxetfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 15.11.2021 13:17, Roger Pau Monne wrote:
> Hello,
> 
> The first patch introduces some syntactic sugar for setting the max
> grant version on the domctl, while the later 3 patches fix missing
> occurrences of xen_domctl_createdomain that didn't set the max grant
> version. It's likely patches 2 and 3 could be squashed.
> 
> All should be considered for the release, or else we need to revert the
> grant table version per domain change.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (4):
>   domctl: introduce a macro to set the grant table max version
>   tests/resource: set grant version for created domains
>   test/tsx: set grant version for created domains

I've committed these, but ...

>   tools/python: fix python libxc bindings to pass a max grant version

... this one still lacks a maintainer ack (ignoring the slightly malformed
shape of the ./MAINTAINERS entry, which imo ought to refer to tools/python/
to designate that's a directory).

Jan


