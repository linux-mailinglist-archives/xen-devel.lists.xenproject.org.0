Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295F6F8416
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530358.825945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvWr-0002Mj-Q0; Fri, 05 May 2023 13:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530358.825945; Fri, 05 May 2023 13:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvWr-0002KV-N9; Fri, 05 May 2023 13:31:21 +0000
Received: by outflank-mailman (input) for mailman id 530358;
 Fri, 05 May 2023 13:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puvWp-0002KP-Rc
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:31:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe02::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d231b0b-eb49-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 15:31:17 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8612.eurprd04.prod.outlook.com (2603:10a6:20b:427::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 13:31:16 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:31:16 +0000
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
X-Inumbo-ID: 1d231b0b-eb49-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEi862MKvs2330hVwolviVItOAAYJTmjM2z61/iRVSfpw9xm30YEjz2/cd/M9p9fLyB0Grnya1XTFUdtBqAqAV1mRg7McUMPq6PxElD+1vDmWpqo1nLOkYH56s9qw+ChFvnOGK9rZooowNdVOdyWp6q27V11c1jJDE0LETXP+yv3c3HrpDcJJXBF4cH6z6OXIDfoH0kFXU353I0Q7ndmmRkW9nbd2XnRZOzQEejpJqf+9GO4KBsGLKXKJc2srjmCUVkAaJHP3UL/Oibt6V9eYJyuOvrqFZLcrD7rATPv8trbYzqthIIA2MN27GFlU4qG9jDQ/FV3igXW8oNDkzyAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nemY/fDaSoviyXOfos5E6LNHFQh2y1QA6DiOYeeLb8o=;
 b=iWpyIl7/rX8V1iVUKGFrinJRAI2WsKXljjKiTL6zOdJG+e2gYllms06Nt0Z3u0ycbzYSAb3E1KEPlKafLKela+z4ct+qQsbS2eDyZMGO33GPp3vJzP+yt23K7/2WY9qx9ef8TDkuKc+kSVPcgN+ZJjqBHgftC+X6qSJDJ+MgtHCTZf85YZbmXliST9vbC5ol9044yLdCuc7Hk7Kc38kNWgWilR0KP2g0clETohiglKIyXDMeGDXu68BwdMpwMWNscdAsxFDw+RjMKZ20VDH3fMFS6cXsfR2lKyfLO/FNWRzkMy+Q3ka0Ggt4PuQR5TMpM3mLnlBLoHJQTO0tjSpFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nemY/fDaSoviyXOfos5E6LNHFQh2y1QA6DiOYeeLb8o=;
 b=gJRbBGUWtfDaJcqZ1d2atOLjJcjBpbIHoAbp5DV5hb//IGOvrnJoS+3vSJVzqew3WsEMLhVIVrmZuNjxFiOQb1b4suYjp/uCfbDxCwhScu2Ke63qELyskvB6Y6WQ71vfsl1R6VL/uREzFHoAdIHfmrzjfH8eaukV561k6p50qAhsL9hLtcJ0qdyIAWdKMuZCdeKueDzAk5+LZ6+JmMKDgvlALCjd1afJ/6YEctzOGj8bdbx4kpktNh9N0mNGuByU+Ul2x9xO30TzW/i47krxnpr0WJ46fBDDoFXpixUBee11x+s/HHGSH4WIaKKOGEVnAN7ZPAEwz0ucY+l2kvpTvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac1662eb-41de-baee-45a0-db01b2141692@suse.com>
Date: Fri, 5 May 2023 15:31:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-3-andrew.cooper3@citrix.com>
 <40d70f11-37e7-ff29-37c1-a94d3e286455@suse.com>
 <8fa2cf23-4832-a033-cfc3-e3225eff0047@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8fa2cf23-4832-a033-cfc3-e3225eff0047@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e74712-da14-46c7-1b79-08db4d6d00a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ilk0LveS/NirsZc6yHXAZJe0Y9HxzBKbeURjXGm9FP40wtFg4sq7S3hv5uuCu0Hah/Fec2j2QhlazIW/tX837t6tOfJUMzdiHF3DKfKZfiN05hYNCNWlCUq5sQABu203T2+fcPzOPuX545QohZuzxufl/LntXK7J4HFiRdV5OExDj2+ZNV9FKyagF9RmheBTKQFdzP69a8mypYWBm0DRF3xTlrMdUYepp3EdD8ia186dCdqMZbkl3qnj+nAkG0ZdEYka2SSTbcMQD5j3Fwb6Fkspgiec0yI1Uy6K/TXNxHH18fpgc5VQoLgq4IUsIoLX0OWV67ZlZlR6TuW/XFhdMRigz80YJsDgIV2bReHeuSjFJsi8TUpA0TyPNq/SB+yX+cgE2thclQUtRHyKP6PmsNXpIFzRNasuLYzc57L3aPdx1OdFHN7+/f7eJcFK3Y9LtG0g7bcUF2ly9nobpt0GAXZEjAEXsSV6usF96/aWBhSzg3MtjqsAlZp34hv5OjTXjJMR8an2I1aIIRwlkaaylYJ46HsqWG+y1LvOZDk/eVcZUKYVvZukRXOKIh9xC/zQ0ykv5oBYzFnYDZp5FmzWehGYix74r3fqeys9mi+eweEl0vJqr7QTwxSDJQ6inoQz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(31686004)(83380400001)(2616005)(6916009)(4326008)(41300700001)(38100700002)(8936002)(316002)(6506007)(53546011)(478600001)(966005)(66476007)(66946007)(66556008)(8676002)(31696002)(6512007)(26005)(6486002)(86362001)(186003)(5660300002)(54906003)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1BoeEVNajR5L1kyVmtWd1hadXNDajNxeDhUWlZHdlFMOWJGYkozUng3VHVX?=
 =?utf-8?B?VFMvVWVoL2l1Rmx5a2pQZDhaQjM1RHhOdTFQN3B6RXBsQ0VRQndycm9kaVJo?=
 =?utf-8?B?Ykt4VlJFV2JGKzFTRnk5Sk50eWhKUUtoM0IzdnVLTngvcVhBRVpGaXp0S3I0?=
 =?utf-8?B?c0ltKzBwWjZCZFNQL0Q0cTYxaWNWQVQ5Ly81MzgybTN4T3VCRVRPZk0yeEZS?=
 =?utf-8?B?bFRkQldCVm5uSDFtRWkwSFp0bkpZa0Z3Y3doZVdjQ0FkWEJsRk1RMkV3Wjdq?=
 =?utf-8?B?WjBZcmRmdVlTVUdFRXFYeE1rMldnckhqdHUyNVpTK0dzY1VvVTJJOXlsNENT?=
 =?utf-8?B?REJzbGZVcXgvY09qRURKQi9sNXU1YjV4cjdXNG4veGdENkVjZFlBSUFkenky?=
 =?utf-8?B?akkzcDVXT05UQ2RIbUJhejg3UVdJamROTTdrdlhOaUNSOXU2NmRMQXU3TU5K?=
 =?utf-8?B?LzB1UmNnWVp1RE1rd3dXU3I0VmxIVjBzNDlvdmZDSlF6Nm9KOE1ZUVJMckJs?=
 =?utf-8?B?d2dCMDNRRExzTmU1NUtuRkpnb0NQdXVYRkd4bVdKZEF1T21QRFFFZ3RpeXlk?=
 =?utf-8?B?MHhLV0FXRWIrc2tZejF0eCswMlhDWmF0RTZkanBMWTllNmVHa1Zjd3h6eWU5?=
 =?utf-8?B?Si9sdExLdFQwN0FpUFdIUmk2Z25jc3FwQnRzTHREZ3VMSmJnNUlieVc2by9y?=
 =?utf-8?B?U1hWbDVjZGZHWmpvYndMellRZmFWYzdUSjZLTHJZNHlnbVc2b2hlRFJVak5p?=
 =?utf-8?B?VGNHUTdtVU82NkU3alZPUVlTSlB1eVNIOUNZTWpjLzJmNjJoanpmcGJIampl?=
 =?utf-8?B?WmRUS2gvbTZtMnA2d0RUeXd1ZW9xdWd5SGhodnBUOFk5cDk2TlUwNzE4UFBl?=
 =?utf-8?B?TFAzdThOT3lYdFlJbzV1VjUzMm82NEg4Tmw0V1Q1RTRVWll3NmduRjdxaUFt?=
 =?utf-8?B?MGFYY0xLNGFlSFJLUlZKcExaSnNGWHJGbHV5U2RicTVSSk9XNk1kV093eU5k?=
 =?utf-8?B?VU9sMnhISk5WQjByVEJvQ2dNN21URG43amoxdWlsNmpLbkNINnhKNEVheW9k?=
 =?utf-8?B?bjlpT0YrTEU4aTYzMHhZbyt0cUtlUjA3ZTNLQ1hiT3MybC8zY3BVMUYrTHlK?=
 =?utf-8?B?VjFmODZtcERsZ3cwK1l4YjJCUHdPTkQvZ1Y4dy82cmJyQTVJaW0rWXZ0aWwx?=
 =?utf-8?B?bCtPODJ5M3RoM0pjMEJGdEZPcUc5SnM0M3VWMER2SzUvY0cxQ1h3NGRCbjI2?=
 =?utf-8?B?eDkrYVNaMnArNHRCWStIaElTb004aEw0V1BmK3pEYnp0K1ZUQkU2VWVPblhk?=
 =?utf-8?B?ZGlnYjI5TEJvN0RpQk1Eay9JNWVBZTdaL0YrdlJyeFZhaCsxalp4M1hXTmVI?=
 =?utf-8?B?K2xERXA0THZTS2o3TlNlZ3NLdEVZOWVGSFF4elFMd2hLWDJiR3REZ2JlU2VI?=
 =?utf-8?B?cU5yNGgydjJocmZKQ1BDUmFQQ3ZyYjhxZGFvTzh1d3RZbWxlRFNxbGUxeU94?=
 =?utf-8?B?UjgrTXRpNlNOT3RKc0c1RUpuOW9VRUJ2YlJoREZidFdWMU8yL3hZMnRubHBa?=
 =?utf-8?B?OXZCRTNIc3Vmb05RN0phSlpoWmRYd0paZ1lpRlMyZUJBUHptYjgvYy9DTFZK?=
 =?utf-8?B?U2t0UlhIMk1YZnlQWktzNWYvUzB4SkpTUmozVUZVU2dqVWRjSjJ3TXJtUVNn?=
 =?utf-8?B?NFdwcEFLSlVQY3NVSnVyM2lucHQxNUsyNm9qK3lGaEkxcWt1cWYxd1hlYVpL?=
 =?utf-8?B?Vys2V281V3lZbkROQ0oyazNiTFgrWko1QUc4RmNYSEtqa2k0ei9GZUtaV01u?=
 =?utf-8?B?U3Y4bjkxaHVuOWFFNGpwQk9yeVVORk5rM082L2F4K3NYOWQ2a29JdEJid1FH?=
 =?utf-8?B?a0kxaGgvcFJ0NWNmY2k1dVFsZ3ozVGdXYVQ2akwwUG9CdTFkR05WcFJoYS9I?=
 =?utf-8?B?RFdjaXNkRVNRVEsxT1JibTJJc010ZS90VnZMNU40YkdNWGNwWnl5NmtaSzhF?=
 =?utf-8?B?eDlkb04xSndoVTdtSmJKUFR3NFgyVGZwUWZxWW1RVUxQYTZySWZuRlNUQ1Ev?=
 =?utf-8?B?ZngzRzlaWm9HeDgyR3ZwTXQxeDBqcktHbWFxb1Uya0M0YnFhR2RKUUY3VmJL?=
 =?utf-8?Q?UZCr7I0lD/PbIsvIguvtszyfJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e74712-da14-46c7-1b79-08db4d6d00a0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:31:16.1528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBSdUWwHBeIjw7zZfBaXkIxa/WgcVKwE4fkTatnra5EQOig2lvxRWEp9OVPfx+/64oFOgbKE5jkzBcH+FK2VNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8612

On 05.05.2023 15:22, Andrew Cooper wrote:
> On 05/05/2023 2:13 pm, Jan Beulich wrote:
>> On 05.05.2023 15:05, Andrew Cooper wrote:
>>> The SPDX forms without an explicit -only or -or-later suffix are deprecated
>>> and should not be used.
>> I guess this wants a reference to where this is specified. In particular ...
>>
>>> --- a/LICENSES/LGPL-2.1
>>> +++ b/LICENSES/LGPL-2.1
>>> @@ -1,5 +1,5 @@
>>> -Valid-License-Identifier: LGPL-2.1
>>> -Valid-License-Identifier: LGPL-2.1+
>>> +Valid-License-Identifier: LGPL-2.1-only
>>> +Valid-License-Identifier: LGPL-2.1-or-later
>>>  
>>>  SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
>> ... I can't spot anything like this under e.g. this URL.
> 
> Hmm yeah, it is irritating.  The statement is at
> https://spdx.org/licenses/ but only by virtue of two tables, the second
> of which is the list of deprecated identifiers.
> 
> I'll put a paragraph about this in the commit message.
> 
>> Also is there a reason you add Deprecated-Identifier: only to GPL-2.0?
>> Enumerating them would seem reasonable to me, not just for completeness,
>> but also in case we end up importing a file with a deprecated tag.
> 
> We have problematic uses of GPL in tree, where we don't for LGPL.
> 
> I'm considering a gitlab pass which will reject patches with use an
> identifier not in the permitted list, and reject in introduction of new
> uses of the deprecated ones.    For this, the deprecated-but-tolerated
> tags need calling out in some machine-readable way, but I don't think
> it's helpful to express the tolerating of a tag we don't have any
> violations of.

Hmm, okay. With the expanded commit message
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

