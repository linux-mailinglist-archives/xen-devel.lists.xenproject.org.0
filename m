Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E679E73C75F
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 09:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554505.865776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCxlb-0006cN-O9; Sat, 24 Jun 2023 07:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554505.865776; Sat, 24 Jun 2023 07:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCxlb-0006ZS-Ki; Sat, 24 Jun 2023 07:33:07 +0000
Received: by outflank-mailman (input) for mailman id 554505;
 Sat, 24 Jun 2023 07:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kD+y=CM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCxla-0006ZM-DB
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 07:33:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab019fd-1261-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 09:33:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9225.eurprd04.prod.outlook.com (2603:10a6:10:350::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sat, 24 Jun
 2023 07:32:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Sat, 24 Jun 2023
 07:32:28 +0000
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
X-Inumbo-ID: 5ab019fd-1261-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyyHRo0Ama/pd6PWkaNtomia12J1Mb8wVVvbB06djoJ32c6hJtxjhnMu2oKVLbk47XODyFE32CIIVSTo34FdF55O/e2iZTz8pSGmrvIQVkaomqRWW6pi9KONt+0hLk2CjPD1SRx77SJBIf3oG76l/BHhVk9NOM/anMBAHSrg+KngOhtPdxjaNDmh3gqrdirRVHS9J6W2xK5y16r5NITIAbgRkrffgm6572YurE+iorb108GkwvAy+pz2+9Nx6jkFFBiV6kPO9noggMyZnKCUvRRxa1j39bBtIzKZdMDi8YxG9sjv4hos3AtyIdaxLdosScU1sOEGdzgw3y4awFYOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fotqRkqNoYTuzqU0W1r0ierS+Msh9fLdtl0bqziEVQ4=;
 b=ofgcu7Rz+kanLdjiq+4z/HD3XeDA3GpDsi9sjOghMPNCOEn8Z58Fjq3ciar2mGVpCO1NzaZj0nRAsO1yH546kIHu/9NdjYUWkttuKAvrWhT3EyaIgSMqJDD7w41RdZnlFktZUJcm5Y75Q9nSVs/afror+W4RJYBUvAzY/Hm8y1TWnl+W2WJJJWgS/QR0cWROa3ENTelbNL02ka05/mGDMC3aY00lm/zZlzgtXEjF71r2k4Oegno7S4TF6HGV5MTzo/yYCKQS+1C47/W4Ddraafb41VzYSf4yeSbWXjYjXxG0fblM5RtziAfnAacIC7v7rvCHBo7HIMWhnMG5EcYl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fotqRkqNoYTuzqU0W1r0ierS+Msh9fLdtl0bqziEVQ4=;
 b=eocVCOmEJYrhdw5Slf52nBReD7EBnOEPgua5L6uXjntPcJoqm4+hg+coZ4I4cEaS4D0vubtfBqvKsvoDLtjYAtI6B8D3VbbWwvsO8qgAkJ3lMflKFtOfCICFe8h7CTz093Pu+OCGbVhPK3/x7oceyw+O3b/AjbCliCt2r4qEUSF2WEwXJImaaF5VlerJwB2pwqAlPxI4QMPozvyypQqhSl2gYbz2UqWerkzLDFfW0D2zeHFC2dt4w2WcWhFbCELZSd/wWlepgQqDMQjTcOmcyr7kKpNCqMEixftjexzIgFuRoKB74QtbbuF8bSakq8ApukjTRYdW9d2uGcnbgMsgtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb629e26-0673-725c-c02f-3d5300c2c406@suse.com>
Date: Sat, 24 Jun 2023 09:32:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v4] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4ab190bd0d80898311aa9f1e912f18e7cdef2762.1687510380.git.nicola.vetrini@bugseng.com>
 <f099efe2-e318-a40d-5254-e9c1e87578e6@suse.com>
 <63d48b43-8ce9-3df6-1407-17c2af734828@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <63d48b43-8ce9-3df6-1407-17c2af734828@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0051.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: cda6ac62-f6b2-4e0e-cc8d-08db7485293d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wiOJHuByQIfLfPEjizqiy9uu68I7T0rQidn2IxEHdHuEKHBO7hgCoON7fTT3cQUZrccCWQsXomR0xe+hv+A5q01b85N2LEsBB2hSO3Bb66p0hhRC2Ioob8jN8XzHp/ro64K0kZM0LwgV6W5TTRRWo6HSpEuTlM609FjJ4UYs3KhCLZa0XFtcc+yC6Cp2EcHstJDm3BkpofqWsQnSbhtINQfTvsQgZIsi/g+1h1ZOXxE+oGNKa53SBX6mzknVErxzz6hCsYPOSEwl3beIOYaC2xPs3Jr/GE6Hmj1kj606P1Ga/G6vSApaiM25BB3ZqhGQe8Rs0AC+92dJ0fbAy/bOMR1zamdaXPXDKmCiP4+tjLguq7vnyaFdssa8sJMwkWr/zOT7wVNDvLQMK9IlffDZWvA2MiGpd8aiTXghUl7YIofO+qdgmJ1Uioswmn/oDMrAyyjMkP1Va2ua3zLs4DY71Hf0b1MMAlvrsGvJsgS2sBTQ3UJpoD1ITYy4SMH42wD5TjWKIfX0zj8Bm2bcrqWnf6BktKs1I1BwXpNod3RNRcNaLUDrh0yS0Him81GweaVvGZAk6S3rIC0MMJ16iBj4E24U7tljLI2BXtN6yAFfyMtj9UoJK77B3cNFcEut9SDI/gZmSw+MAK6x23SFQavN5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(7416002)(31686004)(5660300002)(4326008)(66946007)(66556008)(66476007)(6916009)(478600001)(36756003)(316002)(8676002)(8936002)(2906002)(4744005)(54906003)(31696002)(86362001)(41300700001)(6486002)(186003)(53546011)(6512007)(6506007)(26005)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVY3dGFXQU93dVFXako4WG5BTmNmNnBGM3N0ZEhYM2p5VTF0OUpYdUNzUUlD?=
 =?utf-8?B?SDZMU3F3bzBGNkVzVTJMRDZWV1RraGIweXIyVTBqUXZsanhuYW5Yb2lMSmw4?=
 =?utf-8?B?Y2E2SFRaMHZTb0pXd1pzMytNeXVyUTlhV1VkNmtTUzdBUTk1ZDg1ZXFsUXVz?=
 =?utf-8?B?TXZlZjZ5eHJMTVNacHhNWitiWXVDYzlOaVFnRjVPN1ExYWVVS3ZrU0FxV2ZC?=
 =?utf-8?B?eUtNSDU4a29najNTTFd5NlBSS3VFYk0va3dPbkk5SWUxVVhUTENuclBsbWVm?=
 =?utf-8?B?Z2hZWVoxMWFGNndKMWI1WVZDNHUxMWk3TzlqR1hiQWhocEVqamxhUEZNVGU0?=
 =?utf-8?B?KzN1K3JOdTcyVDRaeWkrYUxJeVhPMVVXalpQdGdNOE5HYVdHMHBJWG1VR0ty?=
 =?utf-8?B?M3lXNm5jQzFUT1c2U3ozZmpUbUdJWGJXaEhKdE4xYTZoQ2tBWFZvVnI0OW5E?=
 =?utf-8?B?QUNDeFRkMnpOVmUxeDVGYXVzSjBwcWQ4eUFIV1l3U1h0OG9YbEcyYnh0TXM4?=
 =?utf-8?B?RDJxZHpFL1RFTTd0NFRJVlhwQ2VQdmZ3LzEybVFNdG5MdHIySXgvOFZpNm9r?=
 =?utf-8?B?UUZwa3B0bWFKVUdYTTlJcUZrandSdVhqYVNncmxXTDJnaU9OQ0JONUx1Y08w?=
 =?utf-8?B?d0pqL2liWEZTMGJoaGwwZjYrek5iVlp3VS9icU1PeWtYWUlJK0N5aTVZMkNq?=
 =?utf-8?B?NkxtcWtQRHRacDhvTHh0Sm5SbGdmeWVQREE0UXRMUE81VllVOHdWOVVLSWty?=
 =?utf-8?B?bFROcUxCVUpUaytPSzkwbzFnSTlLR3ArWGt6R09PaHhLTUhFRTlwOFZqV2RN?=
 =?utf-8?B?RkNkUVo5RWVRUzF4WG05M051VnZJVWRIYVJOMmpkNlNtMDhRcUNPbjluN3F5?=
 =?utf-8?B?cW85dzhjaXR6aWI0ajF4bWhHck5WeUZDeGViUEhDT25tQnozRndxK2pOQS9w?=
 =?utf-8?B?Tm01YUhEbVVqbkdhNEpybC9well3blFGTUJ0WVIvZnRkcHA1aG1uaEU1SGRE?=
 =?utf-8?B?RWtjQ1kzdDNLbzV4RDFSYUpUejgrTWF2NVpsaTBnMGhDMGk1bCtUNHZ1YTR1?=
 =?utf-8?B?Z3Y4QjIzdktJdGZTcmd2TkpEb1NuRHRYRFp0M2JRUU0ycjBuOHdEUU9idmxW?=
 =?utf-8?B?WlA2WlRJMlNtQkFvQWUvUG15NU1ib0psQ051a2plNmpvczBhOFlrNkFSeGxm?=
 =?utf-8?B?ekIyOXJoeERvODBMblYrMitscjZHQnRsamRGVE5NbHlOUjA2SUFOZkVWeXpX?=
 =?utf-8?B?TTZ1WW55YU43dktSckUybUI2Q0VuYktCYXBTcVZYa1BOcncrN1Z4ZnJFTDRO?=
 =?utf-8?B?WGd1ZTVNQjQ2VjhtOEpYNGFNTllnN0pxUU9iU2YydjRSV1VXR0ZPV2J4ZlNv?=
 =?utf-8?B?ajBobStGdmg5a092Tzdva1FQc2ltRzhaODh6R3VEbEFDcXRXdFFrU2grNmQ1?=
 =?utf-8?B?aWVuVUp6QUlPV1o2Q3J6RkY0cTZKQ21PR21STDZCSW9seFFOcWl3YlRsZndL?=
 =?utf-8?B?V2RqRjREc3g1NkJwMnV5aW1waEd2VGVIY3ZZUlh5SURxcGtqbmYxZWxIUkJ3?=
 =?utf-8?B?TVhuU25VVFR1T2hJcG1YcnJZYWlQL1lWUmhhWSttNFRmdWJUSEh2QmVZUlRz?=
 =?utf-8?B?SW1CWUFadUMvQUw1UU9CeTRlUUNmc3pWaE5MM2EvanZ6VkFnU3dGVHphZzRB?=
 =?utf-8?B?VTBqQzdrbkFsNWZiMXlJV1FHc1JqeUxkVlJqUkVWSG5EejNzZkdmR3dYVWdo?=
 =?utf-8?B?KzkycXYvKzFhUHNOUkxGWmpvTGtiR1huTVlObHdKYW11TEw4R0ZvcisrQURM?=
 =?utf-8?B?eVhya24zbjBxWkVDekluQUlYekpqemovSzd4WGl4QWNxSlB5clB0bkFsVG4z?=
 =?utf-8?B?NTZaa3E5NTNpdjh6cnhVQU9XN29vcTZTRTNzemkreVJCZ0U0RVlXcWZWOThP?=
 =?utf-8?B?VlhUWnNJSDcvL2U1VStUSmNUdmhDYzZpTmQ4L3owc083L25rcCtzMldWd3BC?=
 =?utf-8?B?eDNpYUhZK1R2WmFJcFZ2dGJXbkppZWRZYVY1dVg4SndLNXlMcEYrTHJEUHVF?=
 =?utf-8?B?NXMvcGRyRUNSLzFHV25teHJSaEg5OHhmN0RCVEdueGkxSkRpM2I2cVFkWFh5?=
 =?utf-8?Q?W+sqPUHEuxy7/HXQOE0I74fkg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda6ac62-f6b2-4e0e-cc8d-08db7485293d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2023 07:32:27.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTY7J61KcpXOFJJmdvwknKhJgUSI5lgspkWFtQZPX1hI/gIpV3iKR7nhuS3hZyhuE+lPGuC6peE1ySZ2k9eZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9225

On 24.06.2023 09:11, Julien Grall wrote:
> On 23/06/2023 18:16, Jan Beulich wrote:
>> I'm not happy to, with the continued use of the
>> two U suffixes. It may seem minor, but to me it feels like setting a
>> bad precedent.
> 
> I wasn't able to find the reasoning behind your objections in the 
> archive. I would like to understand your concern before providing any 
> ack. Would you be able to give a pointer?

I appreciate the Misra-invoked desire to add U suffixes where
otherwise (visual) ambiguities may exist. But on numbers like
0 or 1, and when use of e.g. resulting #define-s doesn't require
the constants to be of unsigned type, I view such suffixes purely
as clutter. In the specific case I might go as far as questioning
why, when U is added, L isn't added as well, to "support" the
size_t result aspect also from the "width of type" perspective.

Jan

