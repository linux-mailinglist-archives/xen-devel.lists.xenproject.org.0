Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E660A026
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428893.679496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvUN-00039d-Lz; Mon, 24 Oct 2022 11:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428893.679496; Mon, 24 Oct 2022 11:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvUN-00036Y-If; Mon, 24 Oct 2022 11:19:27 +0000
Received: by outflank-mailman (input) for mailman id 428893;
 Mon, 24 Oct 2022 11:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omvUM-00036S-GD
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:19:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b75150ce-538d-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 13:19:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7840.eurprd04.prod.outlook.com (2603:10a6:102:ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 11:19:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 11:19:23 +0000
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
X-Inumbo-ID: b75150ce-538d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZAk5fdYMq4mrTpbe7/ge5UguUqSHnl172nZ4ALV0MGLiapCLFgtI5jZtpZ68uWvFFpOt7zXJSyXL7o2Gd952fG0Nkq5d7xEiyifJIOa1irqmzXRIFy+wy5zpX7W7XRBxIZ29TcgFiNxsZ9vb+jOXpRYPGOAhuzFqffCuHOE1lyesIP0hht9/k9klbfYhKn68tbhaMbJZ7nbjta6XafOq9K4aZQQurJZVrRb048E7AszPufkW6nzklg0V6iKgjUz/2d8i6pYt50ySy3/KLPets7EDKZSuQoUmE1sJnkDS3iRDvZgNbR2KJYYxdCJ57PG42YpRd4lWiju+ZLcsyIQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8kZznpgOg5CqY/vO6wbKyA14Iki5cPMQ5lTivfHkHg=;
 b=SBdvT9r4kXj+sJlW1yNEF8ZlWey50K5QqiZGfpTWzIfRPO6LdwnyJ2jfn3SnLZBRgZHNDKAC9b5+wn7p8cyhyYz2kRrroG/w6m7G+Qkh5nR2BV8I72RW8/8eaO018p9vS9g0uQdNIdH82v3U5LwwMVSr8KBKQzzN9OVLwc3mnvbxm2yRWQ0WXmNo3i0zNkKjlm2bkciUGopG10QQY8J7o7b/TFYfbIFtKjpRs6egLmMyA6dsm5mMs39WSNtvFak8HchQxcukfyZRM24dUsj9IpL3Jh/8hJStuJUSdD+smkhHMncvrbliOsDcH7X7SqhkjoSSu2d2uIBaWhM9p42qkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8kZznpgOg5CqY/vO6wbKyA14Iki5cPMQ5lTivfHkHg=;
 b=mYVHhWmVCr8GR0fKmVII/8R3OjRnmm/2wJdbFRVcehEth9jZ60P7xY6tqeb/qgyvG+zvqYf1qOR1u4r7Gg8F22pAClNKk8kcyz0ItANqVyGyR6ea2PGYYHI1ZBo3NEm752TB9M+dolf6nJD1hYVo0PAA5qx0QiY9p2UZebLy3nq+2QO7ApBzbj97TQwH0bgAFz5ejfe3mkB0mxx7ZRJOdzhtobfKUttZitRPmqLMLotGPzc5wQWUBy9z3XqfEfMsQL1amFNdj01a+EDYlqb52Q0EldwXGACMPv6moWPgKeCu7UNl33a/OWTkwfANSzLrs1WqWip0TqJ1PYPaOxrKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
Date: Mon, 24 Oct 2022 13:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 5/6] pci: do not disable memory decoding for
 devices
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221020094649.28667-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: a2137ebf-5e4b-4b87-8ec6-08dab5b19ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ZkLFoQUVopRwzabIFHwBpRmQGoMe1weekABmYcqOIR/QotzVM8myIM4Zj7AgFrrvfGdZVg72NkpcPIci2vNwQqQTALxUCcayWpPcj/eYe8sif0gVoZnOPeURZvk5S8ezm0Vszh9OXCcchzptLEs0/Ou2a0hclyLwrchxf7Jxw4Tiadu7OvfbX+POBHRnL/ciP2Cw3ZIilaosYZ76TyHiDax0Ga1G6VqaqKh2LcOZyv28OclKpKb83NZp3Vemf7ANbNH5I6Q6/m0WkWuay1ZBKc5gWiBo3CdgssejSmApB8VoxlE+PRx1v1cNrpf8oMqFbV93ctx7BerygAR0vYq+M9Uv0kPYlTH3efnz7UiWD6uJLEdRxZF439w8+u6TGlgm8JrN3WWelQcX/JIstIdBCGxl+LXwaNckmynKtWzt5DcF9TcgvHAM/2Q/K9mYNma4GL4PRg/sCG4SAklJbCUG9FqpP1gXZa/tPkZPbn5cJEaGK0TERTTNI28BADxFdu6jme0ir13IwYLrMgwG1ARIZbM7ILZmVzDzgOP9LgCku3UL4UqBoPFobMx4SGmeJOh31L4o53trP8PWKnY9yo5TOP3ahecihUsuJOTKIC9qnHXL5mKdG2UVVHa8DBqU8jCWGp4WK/siqWNiMGaVgmOjPi/6IRiFw1RgTiO+JyiXcCPUfG6sRKg6oU/ThAlX8snV+N3IwO8+8jm98rkOpSc2cIcaEm6uoZc/DoOELZ19KckUY/KwCdWUfjSSkBr4ygGh8VG09tLkhAGDWxBOYSFB0q8IWsUqofGWJ8fRbTjuTU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(6486002)(478600001)(31686004)(2906002)(38100700002)(5660300002)(36756003)(41300700001)(8936002)(66476007)(66556008)(8676002)(66946007)(4326008)(316002)(86362001)(31696002)(6506007)(26005)(6512007)(53546011)(186003)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1hBR2kxVHJvd2liQTVYUUxkT0p4ekNaaGJQc1VmZFJ1dTZKR3hNdGFJU3ZI?=
 =?utf-8?B?RVlQSFJMYytpNHZtMEgzQzMvUzBiUUllaVNoQ1F1VVRyb1FOVDF3by94ekEy?=
 =?utf-8?B?TnpDS0hyYXdEWCt4QnNaTlRSZzJHamtFalRmN0psdXVwS2J1WlQ0SVlEMEtC?=
 =?utf-8?B?Yk05aFpNVXAxay9YMEFjV3lHOUJYMGpLQlZoK3ZqYmlHQWtMMUVmWmRhSjhz?=
 =?utf-8?B?SFBOTzlIMEY4aUVyNFBUd25qdkJoZWJvWURKSDN2Zy9FbGtPUkF5bzB0YUow?=
 =?utf-8?B?dzBPcjExQmhVdDZwWW9pMFA3Zi93V0UzLzRJWUk3RUVwaGppVUY1RkRKRTM0?=
 =?utf-8?B?Y2Q2ekFJeWUzWjBvQzRjaXV0WmVsUG1MZkFjWW5uSTlTRFB4bHN2RFEwMGpT?=
 =?utf-8?B?cUdvVC8zcVh0WXpHUzRjRm9XTzErMVRneGxZVHZNRTNvMGg4Q1FpQ1NOMkZQ?=
 =?utf-8?B?bEhKMk95S1hGWGdidGJaSFE4cCtzeC9YSVpUTVh6VE1QVEVtNWQ0ejlsdU9i?=
 =?utf-8?B?OVFCWTRxWVdzd3NaSHZZbkdrYlhpYldqd3gyN0xOZDM4UC9OTGZJQTNCNC9k?=
 =?utf-8?B?VHQzcm9tNkFzYjAzbUxWQU9CWElNam9rcVhxSmpCbEtRejRRV2cxNnd1cm1a?=
 =?utf-8?B?NHFHRU44WkoveFdPR2QweHJRendsbFlQRFZIYzUrdTJlRGFSLzN1aEpCVk9i?=
 =?utf-8?B?NGhHQnkyU0xQUmREcVBGNGVuQnRuT0UrUlkyZlJLanNET1M3Z2JZdXZQd1VO?=
 =?utf-8?B?bWJoQWJuZG1kRnR3NW9TV3RSMjRlV0hla0V1c09SaHNJc0IvdW14N2hKK3R3?=
 =?utf-8?B?NTh5ejRyblhqOVVSQ1EzL0hpWnVjV0JzMkpTWFJJYUQ1WjB3dkVkaHRpcVlB?=
 =?utf-8?B?Rkt5cWdSZXpHQlFLb2NQUUlzdG5wZy9kRVNhWHE5ZkZGZ21vRUNqQ2FXUU81?=
 =?utf-8?B?NzZDSnUwakdMUnFWNXBVT3B2dFptWmdiVy9UdTZ6UzRSNWhKUjhxeWRYeS9P?=
 =?utf-8?B?UHZiR1V2R1oxMC95aXpsMnhUbU9zSnNabkZOUmRUVmFDcWM2MGk3QUY3QS91?=
 =?utf-8?B?R2w1RmJZb1R6dmFIZHJCV2NSaVBSSiszTlFyMk9kT3lxazcva3poTTJZaWMz?=
 =?utf-8?B?alF4ZG5NUUdJNzhOOVIrUUh1RE9YVExVbHpYaXZJM2xEK29IeEhEeXBxeG5t?=
 =?utf-8?B?bGJNcEViVnkrSnlKOFljL0Y5cWo4Y21ubFhwV2s0SkxiQ2xWcDJqMTZFVGV3?=
 =?utf-8?B?Nnk0eHlJaHZxN1dBUko4WTNWVFZDTTEvS0I0MFR1aFE2VzZGeWVwb28wWDNp?=
 =?utf-8?B?N3Y5SnVESUtKYVk1YW1JdVdaWFpML2VmZm1ZVURqc2RGc1NBQkJ1U1dYcVgv?=
 =?utf-8?B?M0kzS1NDS0tqbWxLSDBLY3FqbS9uTVF4eGIvYWlaSG1JVzIwOWFEWGN5Vlpy?=
 =?utf-8?B?ZEtockFsdHFUVDZvVzhWQlRIenpBZXFhVE1kaHBmdXJhUVFhV0s2RHgrUnVE?=
 =?utf-8?B?MjF5RzVEWDRsS0JmVFl4LzV1ZE8wTWYzemxoV1N5WEZ6QTVuUzJ3d1RacXpP?=
 =?utf-8?B?Q3Q3Rjg5UURrS0tkbG14bm8xYzdCdjRxN1NSQmRxazhVTndGUDZIZXVuRkNq?=
 =?utf-8?B?YWI5ZGRFUWxWVVExZnhTQTdydG1WTDBDMGwwQUhVYlZoUUV4bVdvNVJ4cko1?=
 =?utf-8?B?L3l5ZFFRcVRXMHRmdlJvMDRVRUJOZFhKQjFJc2RJY1U0Skcrc3BPMzgxM2ZN?=
 =?utf-8?B?VUpLVnJLSEcvRENyU0VKRUdKbGhUTjJBcm1PR0hxRGV5QkV0bEdlS2JSUHdT?=
 =?utf-8?B?U2JMWlRvTkdnTitEVGxxTWQ1bVphRFRaNmhyTlRWUTF2eG9oWnNKWVh4MDFH?=
 =?utf-8?B?ZEdBVytnNlg0V3F3eFdUbG1VWDVScXFSS0d0T3g5YldOMjdDaXU2Z2JHK3Zy?=
 =?utf-8?B?Qi9QUTlPNTVvZk1oSXRPa2tkRjNFRGFLRmR3VWRsYVJBZ3Z1alhIbzBtOGlk?=
 =?utf-8?B?V1cxT044amt0K1cvZkVyRllDeU0yd2ViUjY0ZlpGUTN4T0VKcjhuNVAxdHZj?=
 =?utf-8?B?ZEZKQ0F4K1o4QmRZcXIzMG1vMVJYT000TkI5QUJzc0RJdGZsQVdUMGhpYWJj?=
 =?utf-8?Q?6V2g647GfyiEMobiRI816XiW0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2137ebf-5e4b-4b87-8ec6-08dab5b19ace
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:19:23.8507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clHIZxwe0vEYfRKBXjzhPvlCHo7pPth8DEGjjD1upDn5/lhodrZnac2elPmRASx5NXOc1NT1VypXSFU5Yy5pNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7840

On 20.10.2022 11:46, Roger Pau Monne wrote:
> Commit 75cc460a1b added checks to ensure the position of the BARs from
> PCI devices don't overlap with regions defined on the memory map.
> When there's a collision memory decoding is left disabled for the
> device, assuming that dom0 will reposition the BAR if necessary and
> enable memory decoding.
> 
> While this would be the case for devices being used by dom0, devices
> being used by the firmware itself that have no driver would usually be
> left with memory decoding disabled by dom0 if that's the state dom0
> found them in, and thus firmware trying to make use of them will not
> function correctly.
> 
> The initial intent of 75cc460a1b was to prevent vPCI from creating
> MMIO mappings on the dom0 p2m over regions that would otherwise
> already have mappings established.  It's my view now that we likely
> went too far with 75cc460a1b, and Xen disabling memory decoding of
> devices (as buggy as they might be) is harmful, and reduces the set of
> hardware on which Xen works.
> 
> This commits reverts most of 75cc460a1b, and instead adds checks to
> vPCI in order to prevent misplaced BARs from being added to the
> hardware domain p2m.

Which makes me wonder: How do things work then? Dom0 then still can't
access the BAR address range, can it? Plus with this adjustment, is
...

>  Signaling on whether BARs are mapped is tracked
> in the vpci structure, so that misplaced BARs are not mapped, and thus
> Xen won't attempt to unmap them when memory decoding is disabled.
> 
> This restores the behavior of Xen for PV dom0 to the state it was
> previous to 75cc460a1b, while also introducing a more contained fix
> for the vPCI BAR mapping issues.

... this (in particular "restores the behavior") a valid description
of this change?

> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> AT Citrix we have a system with a device with the following BARs:
> 
> BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
> BAR [0, 0x1fff] -> not positioned, outside host bridge window
> 
> And memory decoding enabled by the firmware.  With the current code
> (or any of the previous fix proposals), Xen would still disable memory
> decoding for the device, and the system will freeze when attempting to
> set EFI vars.

Isn't the latter (BAR at address 0) yet another problem? I have to admit
that I'm uncertain in how far it is a good idea to try to make Xen look
to work on such a system ...

Jan

