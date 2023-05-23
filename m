Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD170D466
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 08:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538247.838069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Lwq-000526-Ol; Tue, 23 May 2023 06:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538247.838069; Tue, 23 May 2023 06:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Lwq-0004z7-Lp; Tue, 23 May 2023 06:56:44 +0000
Received: by outflank-mailman (input) for mailman id 538247;
 Tue, 23 May 2023 06:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1Lwo-0004z1-Dc
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 06:56:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b165ab-f936-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 08:56:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8212.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 06:56:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 06:56:38 +0000
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
X-Inumbo-ID: f7b165ab-f936-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Utf3+MeQbk+v2L5/cn4vqoSbyh5zGhOXTH+K3aOY2AXIE0eP3e6zusBDWiMmEVxs1/bXp/+Qq6Mq0EDDk72t3NDOeJ7u/JwXNPf2Sn5DL0cVyh/gCB7WZigw5SnRkX8NIsn9pV0q73AWneDIpjwtLjhgnxiTOxVKjihTa21Cdo5oaZGdXfE2KZHNNxoEAJuuZqVy/DrmVuqlz5g1G9PsDpAF0HhQDmOMQntKEG5lIeEkS5QuQZ6qjuY0y3g4Y6Y3iBwN0V7kPZib9DsXaKtKD/PRP7Pp7BMSk6VsYrSvKsKl8PvHOdjcqK3/s5FsL6otLhaHrqAKvGg4U2TQwa6xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq2sCG8h2PZErZUNhWKNOGgMwihdTVeyVg8dL/GNLqQ=;
 b=iLsLXYt9l1jYmrs9S1yz38ZSNBM/77NoGO/nXaKbuL4kV5Qg0wWUeymkXWyF3VzEbIC6g7ewrFe5g80dtv9DA579v6Ofzov6/2d47G2hgLNLBF94S+ky84r7U6gZALvLL5090bGrQ9vB44G/QGbYV0La0UbQwE+feV8eI3JJzA+a4WSJZbnTGC1UAgns9T4r3WfqXCgGxlWQ7nOvIlmEcT+34WTpO3jdGCycx91aUw6g/hQeACKkfGeApUvE3mf1JSNP0Heo42QE9uzIO5rdaff5cRHWzqEzXtd5O1UO9DI4LYUgPKiluX9t93xImy2lxM34Ce69bPqzfVGiqs+uvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq2sCG8h2PZErZUNhWKNOGgMwihdTVeyVg8dL/GNLqQ=;
 b=0RiVCRegLhcz8JSKvfb1xxSabOPELjXX1vyoz9Ii0HjLlHIrnuU5ay6lOt/vyfplD/NxooiJyfwi/rL3AL6lZXPvUqZHpH1TEH8TJZsPowYIU0nQGq1ISG0ILhhk9TwPqrwioT9imdMQXrYFxwv1P66X62IFfqhMkUSA0intrNbnMhafnOCXH/jza2ZUF0hyUJyOOIt9qfWYTedKTY75QQCrVHeDrpbCcR3dyx8nqgy6XJkv+82I0gG1IUaZus6APGsmRXtxi5pj0/FqNA4fKqOmLq1XkmNY9POnglYSp16TizLgSUk+XlcsgBEU1+ynEPPhtkrSk74WJzod4zykFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4644c0a3-24c6-caf9-fecb-ac868f0e6226@suse.com>
Date: Tue, 23 May 2023 08:56:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC] build: respect top-level .config also for out-of-tree
 hypervisor builds
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <beace0ce-e90b-eb79-4419-03de45ea7360@suse.com>
 <a08f3650-0c81-4873-ae10-f5200f8b7613@perard>
 <3c9f8fd2-b60b-5540-00be-87351fec656e@suse.com>
 <a87f9103-2262-4fc2-9598-7442074df71a@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a87f9103-2262-4fc2-9598-7442074df71a@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 39932bd8-9f80-4795-0431-08db5b5adac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/H7hP6Xyp3T/8tEo4wireZD0M7+Xwe3wOmPifEmujcmQb3UOKJBo3irCI+NbXQzX5iaVRfsMD1XboouyG9Qj0/pxuKp9MFreQc4C+83faeu7t4lCh9nNZiP6BKlsFMIaIynQNAaOlxrhmSrLkMHFJS8wlCHsXW4Y56+nGwtyEJcEnAz+U59knwzLRK2lqJOLqj4gv+JdtpBhMd641C4l2eqaj+H1xclC4t3FYA7Aathl6Lpri5la2znTu0s7DPLUwqOioSNrD1JOlWr2Lt52aQxrKAknb9LAuuzQkbyOxWqGWKL0DBJw14z8j+HOGL6lpFCP2x1RQkV7hxepZq2IGaVUMmHe/US3yZ4gN225S1QfoEfUkv6ladSMTayKOzguMX5x8HxTPhJkpHuVRsUUxkg8Mfx1J74hhIXod5DnC4u+eFTf7e08DndW9rOLvSkNUlpSZ1Dx0Pv63LeUvGylDzeABpyUzh64OPdAxKvvVg2Q+ubmGfAaksFCXtBxnwHZm9Cof+CZWDQ+Z7D+UMICC/Btl+qQDCLdgS+rkeRVu1msaAzN6ZlrkhtT7r2cozw41rwC0Twdb7+cTu+pS8ITFCYk63Xvr8n/ezhxcIDIMbeykMiYT3LECJEEG76uhO27zNd9oeoEjIe8C/pSJboQXTUnZDr7H609fYyP9JICAs/ZGZKpCm+p45DqvoJcclrD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(41300700001)(6486002)(316002)(26005)(53546011)(6506007)(6512007)(8936002)(8676002)(5660300002)(36756003)(38100700002)(478600001)(31696002)(2616005)(86362001)(54906003)(31686004)(2906002)(186003)(6916009)(66556008)(66476007)(66946007)(66899021)(4326008)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGlLbHR1M05zL2hQLzZ6QTdaR3FkMW94Y2w2VmlmMEtQazM4OC9JMjduSG44?=
 =?utf-8?B?dE43NTZaaFRkMGtkSkRXaVR5TTJycTArb2lBSlducGd4U0FiMVlrN1dLYmdL?=
 =?utf-8?B?ejBNcURJbGRyMHEzOG1VM0t2WDFzMUwvREtLZWxEYXdVS2U2ZTVPZmtmZ1VL?=
 =?utf-8?B?N2EyWVRrV1lTZ2xqM084ekc3UnUvak9TZWs0WEgwYWtvaGM1K2MrNFNnMVN4?=
 =?utf-8?B?Z1dVb2l2elYrU2hkMWRWMDBaQkhlVVAwU0F3K01WTTNrMVdFdmo0dmdDWnpU?=
 =?utf-8?B?NUthQzJMNlVVRDVvS3VHR1Zpa3N1S2daOHhNWDYxWWVKbzEyMU1rZ2ZGeUN6?=
 =?utf-8?B?Zlc4U2EvbHVzd0ltaHRiVWtzMkpwM2JmTFpqdUpoa29DSEErYUxXQmtQL3hn?=
 =?utf-8?B?L3BUWDZYTkE1MXFtRVNYVWNxYkdvV0JrR1FudmQ1cUFrL1plZ08vZ3RhZFJB?=
 =?utf-8?B?ZER0NU1pUHNVMjRJNVZrL0NoeTR6amVHTDBKaW13QUREYXJzUUxtQ1h6KzRP?=
 =?utf-8?B?NUNQK1NoTXVubi96V2ZnWlJpcXFwUjhLRy8vVURvdEJMRUlVU3FkN0kvRHF0?=
 =?utf-8?B?S1NUMHBFd0VCTmF4KzU5QjRxTTZod25aNlNmMjJlR094bS9TdkpHbE0rWjVW?=
 =?utf-8?B?Zy9jTkZhS1FYTjU3WERHWFVSMWRhdHN3enMxTy9Wbngrc2tOb09wUTdlQ21Z?=
 =?utf-8?B?cVZtRW9KbFE5eTVxTVRiL3hKMytqQ01ndGZpRjhzL2h6cWJSTjhFYmd4dTRR?=
 =?utf-8?B?Z0lGekFTSlEvN1QyOHpNY0lyUFVJNWxrWktrN3NmYjd2Z3B0M3FjMHNXWTdN?=
 =?utf-8?B?WFRrL2hkdGNVbWppc1lKZ3JkSWJZMlE2WTc0dHFOS0NjSXFkQkxGdjJQQzJC?=
 =?utf-8?B?QmtzV2FPbytlN0t6QUdKbWl3UlFQeDVjVDR5Tjc2bTJUMDN6VzBRNWxINnNo?=
 =?utf-8?B?MVJqclovdlNNTnNDdEdlMGpxZklCc1hLcU1rcmhnRUlScGVFOHpBbGFJai9S?=
 =?utf-8?B?SklrVXgzcTNKUmVDT0RSeXpiYXVDdE1SSzl1NnlGVm1QNkdEVzRNZTUxbVI1?=
 =?utf-8?B?NUVtY2c0OXN3MFNkbytLYjFCSVBIMCt5TFV1U2pWV3VNVWpINkdUd29Xbmtn?=
 =?utf-8?B?Sy9vdTRQMkpuZVdaMTkzZTgxOVZkS25DZmhCUnp0MWQ4dzJJdFM1SXA5QkU4?=
 =?utf-8?B?a2E4ZnNoRlN5bndiVUxKK1RZM0puKzVoTUdtVng5bGM3MWVPYVJpMDlaU3lR?=
 =?utf-8?B?MkdYWE1vSzY1S1NTNXZmZGw2Ylp6Kyt4RDZDVnRZdndnblFuYTZhZ2tMT2tr?=
 =?utf-8?B?NVNOeTJGK3gvZFJRb2lUZnJGVUlRTlNPNEE4a2N2d200SkR3TUdML1NFNjQ5?=
 =?utf-8?B?dmgxWkJReHNEZ2JZVW0rL1lGTmdkZGpuaFQxbTRrdm1qdWhvVm80K2dKclRp?=
 =?utf-8?B?U3dHcWhpenljdDlFVUN2MnJ6YXJDWVM4SWl5STVjMGlTSU5CN0dSTkNiUVpO?=
 =?utf-8?B?S0cwSUdyVVJiR01WbmNEazNzYm5LVWxjbFRrYXlGVS85bldRc29PSWRkUlc2?=
 =?utf-8?B?OEhXMGErVjdoVXhOSGNibkcxSU14L1lEQmdMVFlTLys5anMrYXY5eTlnRXdW?=
 =?utf-8?B?S2cyNXZkbkdHakYzV1BaN2NOSVF5OTl1ajBKUkNCSmxZcld4cC96dGdrQ0VU?=
 =?utf-8?B?cGZnZlJ1ZUs0TU9ML3U4VVpUZGlvM01xMlZ1RDJ6azVOTU9qeG5zYVhwVWpj?=
 =?utf-8?B?aFY5MlQzRlNUL1RMZ1pHdkpQRm00dDNtMUxFSTh4U3g2TjNwSzc0RjlHVlhC?=
 =?utf-8?B?cVBFVlp6L05MRlRLaUZjUElSMmJ4ZVZ1Q0JkY0thc29rWFdnTERvak4ycGJS?=
 =?utf-8?B?akdQcXNuUWkxWW5OM3BneEVDSU0wQ3BOK1QrR2JzS3FOWEhBRU43Y2J2SkJZ?=
 =?utf-8?B?c0pnRmc2ZlJRM0RLcTVjejh0bktXb2c1RDBMbDE3MEZtaWc4Wm1EVDJad0xQ?=
 =?utf-8?B?ZDRGNUpZZWs1Yk03QnRDVzB2M3VURHJSSjdrR0RrMDZzVXlLcGRZUE5jbDNs?=
 =?utf-8?B?VmZKS1dvSGxKazJnZmF0NTJQbmJIazN6cUNFTHhsS2c2NFVYaStrS2RFSHB1?=
 =?utf-8?Q?ERTOlOrp0bgbYc/ajMXibGotn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39932bd8-9f80-4795-0431-08db5b5adac5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:56:38.0193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc/Na+B1R6Y1iVOlvZRo0l0BB4KACZkFCkhco1zzFW1ta92mOWT/pk2n/KDCmElcrUG5TO5sXp+a7juXxHqTcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8212

On 22.05.2023 17:49, Anthony PERARD wrote:
> On Mon, May 08, 2023 at 08:23:43AM +0200, Jan Beulich wrote:
>> On 05.05.2023 18:08, Anthony PERARD wrote:
>>> On Wed, Mar 15, 2023 at 03:58:59PM +0100, Jan Beulich wrote:
>>>> With in-tree builds Config.mk includes a .config file (if present) from
>>>> the top-level directory. Similar functionality is wanted with out-of-
>>>> tree builds. Yet the concept of "top-level directory" becomes fuzzy in
>>>> that case, because there is not really a requirement to have identical
>>>> top-level directory structure in the output tree; in fact there's no
>>>> need for anything top-level-ish there. Look for such a .config, but only
>>>> if the tree layout matches (read: if the directory we're building in is
>>>> named "xen").
>>>
>>> Well, as long as the "xen/" part of the repository is the only build
>>> system to be able to build out-of-srctree, there isn't going to be a
>>> top-level .config possible in the build tree, as such .config will be
>>> outside of the build tree. Reading outside of the build tree or source
>>> tree might be problematic.
>>>
>>> It's a possibility that some project might want to just build the
>>> hypervisor, and they happened to name the build tree "xen", but they
>>> also have a ".config" use for something else. Kconfig is using ".config"
>>> for other reason for example, like we do to build Xen.
>>
>> Right, that's what my first RFC remark is about.
>>
>>> It might be better to have a different name instead of ".config", and
>>> putting it in the build tree rather than the parent directory. Maybe
>>> ".xenbuild-config" ?
>>
>> Using a less ambiguous name is clearly an option. Putting the file in
>> the (Xen) build directory, otoh, imo isn't: In the hope that further
>> sub-trees would be enabled to build out-of-tree (qemu for instance in
>> principle can already, and I guess at least some of stubdom's sub-
>> packages also can), the present functionality of the top-level
>> .config (or whatever its new name) also controlling those builds would
>> better be retained.
> 
> I'm not sure what out-of-tree build for the whole tree will look like,
> but it probably going to be `/path/to/configure && make`. After that,
> Config.mk should know what kind of build it's doing, and probably only
> load ".config" in the build tree.

Except that the hypervisor build still isn't really connected to
./configure's results.

> In the meantime, it feels out of place
> for xen/Makefile or xen/Rules.mk to load a ".config" that would be
> present in the parent directory of the build dir.

Right, hence me looking for possible alternatives (and using this
approach only for the apparent lack thereof).

>>> I've been using the optional makefile named "xen-version" to adjust
>>> variable of the build system, with content like:
>>>
>>>     export XEN_TARGET_ARCH=arm64
>>>     export CROSS_COMPILE=aarch64-linux-gnu-
>>>
>>> so that I can have multiple build tree for different arch, and not have
>>> to do anything other than running make and do the expected build. Maybe
>>> that's not possible because for some reason, the build system still
>>> reconfigure some variable when entering a sub-directory, but that's a
>>> start.
>>
>> Hmm, interesting idea. I could (ab)use this at least in the short
>> term. Yet even then the file would further need including from
>> Rules.mk. Requiring all variables defined there to be exported isn't
>> a good idea, imo. Iirc not all make variables can usefully be
>> exported. For example, I have a local extension to CROSS_COMPILE in
>> place, which uses a variable with a dash in its name.
>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> RFC: The directory name based heuristic of course isn't nice. But I
>>>>      couldn't think of anything better. Suggestions?
>>>
>>> I can only thing of looking at a file that is in the build-tree rather
>>> than outside of it. A file named ".xenbuild-config" proposed early for
>>> example.
>>>
>>>> RFC: There also being a .config in the top-level source dir would be a
>>>>      little problematic: It would be included _after_ the one in the
>>>>      object tree. Yet if such a scenario is to be expected/supported at
>>>>      all, it makes more sense the other way around.
>>>
>>> Well, that would mean teaching Config.mk about out-of-tree build that
>>> part of the repository is capable of, or better would be to stop trying
>>> to read ".config" from Config.mk, and handle the file in the different
>>> sub-build systems.
>>
>> Hmm, is that a viable option? Or put differently: Wouldn't this mean doing
>> away with ./Config.mk altogether? Which in turn would mean no central
>> place anymore where XEN_TARGET_ARCH and friends could be overridden. (I
>> view this as a capability that we want to retain, if nothing else then for
>> the - see above - future option of allowing more than just xen/ to be
>> built out-of-tree.)
> 
> No, I'm not trying to get rid of Config.mk. There's a few thing in it
> that I'd like to remove from it, but not everything. I don't know how to
> deal with ".config" at the moment, but I guess that if Config.mk knew
> about out-of-tree build, it probably should only read one ".config", the
> one in the build tree.

And that (2nd) .config would then be placed where in that build tree,
according to what you're envisioning?

Just to mention it: Since a similar problem exists in Linux, for many
years I've been carrying private logic to record necessary overrides
in the Makefile that's generated into the build tree. But of course
that's hackery, i.e. doing just enough to fit my own needs. I'd like
to avoid having to carry similar hackery for Xen.

Jan

