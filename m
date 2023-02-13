Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5596946B8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494474.764546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYeY-0005sQ-E9; Mon, 13 Feb 2023 13:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494474.764546; Mon, 13 Feb 2023 13:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYeY-0005qP-BE; Mon, 13 Feb 2023 13:13:54 +0000
Received: by outflank-mailman (input) for mailman id 494474;
 Mon, 13 Feb 2023 13:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYeW-0005q3-Kr
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:13:52 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41e2bab6-aba0-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 14:13:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6903.eurprd04.prod.outlook.com (2603:10a6:20b:10d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 13:13:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 13:13:48 +0000
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
X-Inumbo-ID: 41e2bab6-aba0-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFQ74wYfU3hP+k2aqqlIfCnhAIDW8wPZuH8gYcf8VEURFWg9QMA4+c5biQVpwFEafHBoyOz6QtznPoLWx1sWlRmW/4ccAGPRRV6jn8oUJMbkwW8619L9kdhEGhL6alxpzNz+Bwd9KxZn5VU2ZtIvX9hlQlpXpgwSvcTVLSCPyZHrPl98ZmjqbHlz6Bjaz8b6MJoD4r0HmU8tyHgaS48u1R1K7FhONgGf0PEXh8hZ0qAKjwDpWAzmYfIsNHx0At4h6ku8lHjtHqCyEUCG9Qz3H4TDT6HGNN27In1z7bBvLn93Mrkk6Ce3iy027cXbhS11q3DvspEyLog/N8iLtslsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x98zAvMGEEcmjRtGcu7+qhbLmziWB2IG23JPGgudsqY=;
 b=jdk6zsH/u5xcJS5axnPFTpbvPgIZZIfpVRkSRXNGTy29ZDkiCJvBhtsnpVWmJ64rKiaur4uPPhAM9OnLi6opSwvcpS3TRCH2ALyKRLmoTF0BbfJrypyL6QjVUECk7L8brFb12420MuNhslIiimdS5SDhFjBI7eje+aP+0/HByEFJzUqGi5WetKCtNJ1Vk+X3F42wWNkDY74A4XwrYcASOl6ykvwb+/Ndtj5I3eN/F6KfAwAjl4W+cFlzAcWwf0GpFoqOv12Q5arjJAO2XRICSbT0IqnFUPGQJ98Q3iV6WBNtcHxMNYgsic5/qS9h/WwogNVkv5bmICBIRlEc/TUmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x98zAvMGEEcmjRtGcu7+qhbLmziWB2IG23JPGgudsqY=;
 b=cyH+rTuTvSy4B/v2mf/Y251kdv0mC3IxOkMV32dL1mAUFRv0fvRNX3Jng6wpwjQaAFYd3IB3NWjMgpr/GEbgbpzlREMaq3dLy7UFoLZD9y+b2qdsQWqvxt+yTGvHqc/PaiUQ5TjnxGnNpZYiLAnjEirNYgxV4cPyYoOUCnsAmXJcQ6kM2/6CAErvbiPpU+11jgerqY2YSmAeTSjh73R3o8Lj2m7Df3ia2Sm3RpZm5FXkSXXnbWPCV/SFg86/rAeSXO2wKV79qIi9rEU+MlUZ+20akKEr+4H/cuZ8BaY6zfR++myRZMf1cs0Ihkcox9G0yCWU6sT77nakEcf2SsSzVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e29d3f2a-84d2-c291-c479-c7be1f87b11f@suse.com>
Date: Mon, 13 Feb 2023 14:13:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <5a427934949e3b0cf6026c8ad6c62e37e5250ca7.1675441720.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5a427934949e3b0cf6026c8ad6c62e37e5250ca7.1675441720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f73001-5dfb-49c2-942e-08db0dc424c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kim/BDroFtVLohwKDhJ3cB8fz8MH98N0lFjwprzt1aocxP85kaxAnIp8Q+bAxYgbrBBAKLEH8AjDWwVR2yv7QXicFq2O8smS1an/ukAD7MuGYiKYfJrchCYZkMzt0TCj43t2cY46BDbBpUjgwtjyqh7XJ2HN/ngDW12pYzz/VcstCiFw0FAFDgMUaEHqJY3H4HmWz3nDYA6nN5W4QUzRFI944XJvRN4K5BABxW0dfvUn2QiWAHstLovmVWEsRrwAeXpsYXZ9cYBVyyeBvtlQKCzFnLT8wXSU5kSPy/Uy36MSEzjW4K7zNrv2jYs2AwnufWKD0gesj/vMAVGSohBW1PM1QariCwpbfLH1VqWN7BeQTZBdoalMXBGVyp7dqV7kMhCF4i/klJvs37bn9oEOjf7qxFdNmYNsYXQvExzyuJk6Nlm14I3n7YbIeFwCynlF8xjmk9AhKFePqzh1gnkpVu4XhBexop6YCe8Bt9Egsa/ZX0buN6wHz86+aD/g9ZXmO4y/yXNqTrmLHDVG+ZofbTMP6KFHt35cY8crxwQYsExdkIIA0s1taytI0auKPJJGpqvpBQ5QlMOB+SXgEFniel4savrhJAayqvjnKwWzL6JE1dM2EXqBW5N72p6UfdTxdK7i+HA9JaDzzzpHqWRTyqYcBibaZsVqZVZ3TZ/uQgwPzCqUUQnm7NanWLacPfMkQiJjv8XVyKvnl5emOgaAQ50GplaeWtLWDnacx17LRW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(136003)(39850400004)(346002)(451199018)(6486002)(6506007)(478600001)(31686004)(53546011)(31696002)(86362001)(6512007)(26005)(66556008)(186003)(316002)(4326008)(54906003)(2616005)(8676002)(66946007)(66476007)(6916009)(36756003)(8936002)(41300700001)(5660300002)(38100700002)(4744005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ZZVklNa2loUHpwZ1V3WjhjaFM5N3B2Wkl6M2MxZk13ZUxMZlN4WERvSnQ0?=
 =?utf-8?B?K1VpTHFmRHI3Z1lmZlIxS3JlOUZ3UFYydjJ6RGdJZHVycXc3ZUxHYmwrdGlR?=
 =?utf-8?B?dEhaSnBzVkVwOUlmUkNDZ0pBRForV2xzQTdNTmxjaVRSb2ZzT2RWYmZvaUw2?=
 =?utf-8?B?U2Z3dlNFblZDUlZoYjFFWmtidUExT0VlaXVSVWdwVW1MUXZpMDZaVXRFTjZZ?=
 =?utf-8?B?emh2V2U2QVMvanIyVEVBWmVUekVpaVcwelo2ZHdEanNmbjZOdy92Mm9TQUVQ?=
 =?utf-8?B?TTB4YjhzQk9MU09YQ0FEYnJ5NkhVWFVjTldBNXZ4WUxxTi9ZNFZvNU1Ld0lB?=
 =?utf-8?B?b1hVWm1WN01MZFhDSHgzcUViQTRsVk5meHRpTk8vbnBJY2dQcy82WmhOVkNW?=
 =?utf-8?B?UW1WTDQ2LzBweEpQbFlEYzFoSkhDditHcVAzRUkvUEkxblVMcURwcGFMNGVH?=
 =?utf-8?B?bHlUOWpZcDFBOFZ4UkVOa0hadnB3VDE3WngvMC9VZENaem5qa2NMN3hxOE5K?=
 =?utf-8?B?aG5TRUVhbFNweS9zcXRwQ3BpMU5Ja2c2dEhUK2srTXU2YWZ1L0RlWVR6Z1Fo?=
 =?utf-8?B?MVBVSXk2RWN5a1F3MXFHZjY1U2pyUVA1VTB1VGg4OFNobHljUnYreUJmaHVC?=
 =?utf-8?B?SW1JTUtFM2o0QzBJVmt3eWxLQzltOG9WNWZGSnljZkxvdGhzeEpGeXhoZ1BY?=
 =?utf-8?B?QnZTelFyS2NrUHFjUGpGUjArOFpmVGttNzBCQ2dJV2Z6V3k3MWloN2poVUwy?=
 =?utf-8?B?UkFSdUlyMXViTThXTlJKbmMzNlZ4d2pmdkR4UHNZU05hNFVIQ3NYNlhKM2Q1?=
 =?utf-8?B?aU52ZUxWd2k5RHlacTAyQ3Nwa29JbHhnYXZZL2VlaGhvZnF5RlRtL1BvZzJs?=
 =?utf-8?B?cDRNd3NQM0RTZ2lBRldzYkNOQjRGbE5IZ1d3aEJNbWZObk8wT2oyR01UcVlT?=
 =?utf-8?B?U1lWNlluWTdhWXVMUkhrOVV6eDhnTUJVTWQ4Tmw3dVVTcjVaNFdMWHJzVFBL?=
 =?utf-8?B?T1UxZjJFV2piVG5idXVtMlVOeUNiQnl1WkRNZVIzdUFXbFpKbFpCZkM5TjFi?=
 =?utf-8?B?NHpHSXBWbkJIaG1DTzlQbkxQSU1LTTIyVmhtaE9La1lsVlVoRlM0T3R5RFI1?=
 =?utf-8?B?T05xdE9PdlJVUWNPSTY5THUyNWFRbG1Ia2h2NjVYdFFLbjFHcUZSNDFZdThC?=
 =?utf-8?B?R0pYaE5MR0RtUWhDOTMrbkpKM05UUTZ3V2FIcERYajRPRlI0S3BnRzBRQXIw?=
 =?utf-8?B?SHdDaHlOaE9RVXdDdlhFc3pDdW9Ub2VERDJoQTFmT0lXWXBIV1E5a29hdVB5?=
 =?utf-8?B?eU02M2tSRE0vR3dmTGwrVWlqMGZXZWVPeXRYRXVDSEFuUm1KUjRiMVNhSnpT?=
 =?utf-8?B?Z2FVdFdaTzRESmczQVFTd0Z5NDJPemJoaGtodE4rMTN3UEl5TEU2MEtsa09V?=
 =?utf-8?B?c3lBSkhkcDRpaGQ1SUNFL1pXTXFIWHJWUitzS0docDZJSXFwNWp1ekZpUzZa?=
 =?utf-8?B?TWhOYkRDbzNzU1hkcUhkbXB2amFkMmJoNVR5M0kzZmZvaHBiYkV2R1EyYUI5?=
 =?utf-8?B?VFlUbmFIbmtrdmJkcmVhbmJJSkQ2NDB3VGtxZGI5SkFCMnhQQlR4U3N4MnFh?=
 =?utf-8?B?MHdXVWt6SHQvdWp5Ym9oLytEVERScU9RS3dVVndsbzBqaTRpSHVzZHQzSnQ4?=
 =?utf-8?B?K01hV3J6Nnp6NmVxcDZEQ0pEbnJXWXhIcnE4dmFXQWFuOHdPWm9CenJBRHFX?=
 =?utf-8?B?VndNM3JySlFzV0YvWkxCS0JLSGE0dkNrNldWZVIreG1hdFBVNjUyZHkybFlK?=
 =?utf-8?B?ZUFmaXFIVjRPalFLTnRMbzFFMDVsOG5VQkFXYnRYaHM5WU53UTZlWGdqaWJp?=
 =?utf-8?B?b3pIaDhmU3JMQ2NWSTdSdStNMjcyK2pCKzg5TUk3NEpldWdPMVlSOFIrS3Qv?=
 =?utf-8?B?V3J2ZUdmcTk0R3gxRUtHbE1oM0MzL1BGQ3Q1a2VxL25qS0pHSXMrVHcrZVRP?=
 =?utf-8?B?V09oUm41RmJKSGhNa3VnWWxYVU8xem1MaVAvMlYvcmhsODFOVW8xL2kzT2Y3?=
 =?utf-8?B?UEFNaDRTTThXTTlBUmZSbW0zTk5QYXoyb0dUUy9GU1FRRkViWWVrZG1zdWZJ?=
 =?utf-8?Q?AEQHqEH+lZrYjj9gCRPUzz+b/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f73001-5dfb-49c2-942e-08db0dc424c4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 13:13:48.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LENhdG0r8ieUWfFw7lDrU8BtnTp+wzDnqVfE+39oknNycIj4r60Zvuzsd6Ro7JzggV3G8fF4E1uBgHwnBNB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903

On 03.02.2023 18:05, Oleksii Kurochko wrote:
> Since the generic version of bug.h stuff was introduced it
> is necessary to rename all uses of <asm/bug.h> to <xen/bug.h>
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Doesn't this change need to come ahead of at least what currently is patch 3?
Or else why do you say "necessary" (I take this to mean the build otherwise
is broken)? If the build works after patch 3, the change here may want to be
drop the unnecessary asm/bug.h includes instead.

Jan

