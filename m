Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE56BD0DB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510601.788556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcngH-0007hB-If; Thu, 16 Mar 2023 13:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510601.788556; Thu, 16 Mar 2023 13:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcngH-0007fS-FY; Thu, 16 Mar 2023 13:30:09 +0000
Received: by outflank-mailman (input) for mailman id 510601;
 Thu, 16 Mar 2023 13:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcngG-0007eQ-BL
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:30:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5898ca-c3fe-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:30:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7465.eurprd04.prod.outlook.com (2603:10a6:102:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:30:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 13:30:05 +0000
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
X-Inumbo-ID: aa5898ca-c3fe-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEPxSbmLFcAFneXRXMuYT2VdUkkZvRhzG0Smrv9uTwVl7AwxrOJJoSiPvawC8Di7kIt1MJRcjKxk0sHB3JBJN31W6bzGO4bPS/XkO49lF6YuY+jKNWQ7ctp2RpSpFGNawx87Nekz8SF0OEdcjArGGKM2UTcxYwGnYMG0uFitQmuwGfFmBn1d/SPQNIeSglQCzA3amIfNFuPU+57OtGBaGbidjbwrIPtlcek8tJ6JvefZ4/0osL7PbC7JxABQEQJMZF5yDu+bxEjk3c1xc3EErqbVV9BjEU2hp2BgzgnA+KtY6sLYaTFFZ72BI+nXPNEQNw8jUM5xQ3qai9FDBl218A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUPrYMX1oj9WbH6Z8NhWbGl+MxeAQXSqdKsLLe3AQgM=;
 b=bf/0bEVJZ6AjG3uhPP8Wg/fCDghNOBeFcK0yodOcZ/atu1PZ7mZQTFMC+6AGKyLTvecwCHJoBV7VLrqofgK5F7DcfPdEoa19bHgsX/voOKHI1oo+Cm3KkXsIFkaG5Zfr7xhqWnWkGtGzyxmuSvdm0rtNPdvuRozQjKD2eu73cgn63PAZAuEC2e/oS5Rp6ERNjQDt24/iScpekqr7A9By66U7nq2/HlOjqmq7Xf+9sXkkVnPslIiDXbkiu3JbOucvHU/3cN7kF+H3wJ26pqBYrTuBwE1K1pofMn1eI3u7yTx7YnM9x+Ls0hLvmTa1B6POrkh95NfaIGEpRJfprj+8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUPrYMX1oj9WbH6Z8NhWbGl+MxeAQXSqdKsLLe3AQgM=;
 b=xhTe1/d8CyiEoFPvemQdOvhfWMnx6LMA81aC24f2IB51quBEPd4yslCfScTvNY9cHpKiJr8BYNuLRYPGffDubQZMYdB7QEjQZC2u1mcoyC0YB4NplKk+7WiMoeSVAEBW0rxfJ19frE2Y1g6x8xnzLjr40qfRwxxpXjthluxk09olUFldLqhCTMdt3he5CqlbcPxokQibsVieow/GYBFkBFwg/kTMu9fWnTQvttD8Ov4bI1BMJ6a2JheGxUGrK2XsQWx+oQQJB/LyEkwcWcY/dwFe8oaVy5wHwNO5HllpH4XRn3DGB+Iyq0AqNN/wOr/WRnv4g/wnA3H0foJdT1g9cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55c5d28f-8dd8-1d33-f275-93547b0bd94a@suse.com>
Date: Thu, 16 Mar 2023 14:30:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: omit "source" symlink when building hypervisor
 in-tree
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ca9930ee-e6bf-3cf3-633c-02d5f21760f5@suse.com>
 <6880d302-cc8d-4719-be15-5a0c6bf4c847@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6880d302-cc8d-4719-be15-5a0c6bf4c847@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: ad38bb42-6b99-4a95-2846-08db26228dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8i2ZQnda9pihclwnSNgVQuH9wAK/MeiQOpZv0UIWLL8gzHStxqKTNdc3QsL9tPAKmy6NeOKBlLyLC9j+P2DpPh1TuCs0Jt5RoW2IqxzNTDCjCf6VZYs8yGyHelS4KRXK/J6XLkKh+XO/NRUonG4dO5ljizikRYPTwYuOEQZVthqZEs1fNlJIYJth3CybFESPsIo3jQtwmJIuNOvxZ+kAdW5ynDIeMYGdACe71MtAAwxSGSy+YWiTfG2VsoqnPaGTu3FYH8jPqnkcvCG8h9aia7vUkrQjHEkUTr+4VAo6kHK7dLFhE9dVlJs2DNV6FyEFAac2g/UOtP8AfK8elFukHaMwp0ylpe8lJj2UYYuGWK5BtEkcDaztdR29W2RlBq+DfS9QvMqrZ8GvLo1l77nsRSrXMfU3mdb4EFkp7rgihHeQflNIXvrymJ2pePfc8R8n5WJlLCtpnHgClcWm3FQ/4n/SI17cpwXeCV0LhHJf5aCTb/woWB6Rq0Wjy3EkMbSQv0St4Ys38cCZ3QOfxd/pzNRS5b/UMQGOUsOI4o/2qq2ZWTX3j30Txj2nbX6UetsuBP0/jfTKb77jOOwkvif//K7aqSzcpccwzHU/8dk4RUXKi+ODxuS27guBEFZvp6TIBH/Luyz90Xd9DvYOU6Vbs1I1jtUVdS/+XaOYymm+FMUh5mQeku0YcTK4gHy4ReR1nzXlbEeZAo5BJP002s7AtOhV3th8UDUv1RgDiHjkL0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199018)(31686004)(5660300002)(41300700001)(8936002)(2906002)(38100700002)(31696002)(86362001)(36756003)(66476007)(478600001)(6916009)(66946007)(66556008)(966005)(6486002)(8676002)(54906003)(2616005)(4326008)(316002)(186003)(6506007)(6512007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFpYWnk1eXNlZmV2WGIwWXFQcWpZZjA5L3BtZmthbnZKUEF1aUJ0QVJkZ1Z0?=
 =?utf-8?B?Ry90Nk1aS2QzbjlRVW40L1FEZUJmVTJrUnJUNHYvUWFjQU82UWFZOXBnUmR3?=
 =?utf-8?B?SHFMVEtYZUxJejV0aGIwMVFiVUZpWURXUTRSODlJYnNEODJGR1haNHZsY2xM?=
 =?utf-8?B?a3UxNTJyZjk0T05OZFhFNk5NandTblFodlQ4WjEwTVhTN1FtTFF4dDRXc2Z1?=
 =?utf-8?B?VVcwYWlqdjVSM0ZTRnJ3N2c5U1V0M2h6YzN5SkFKcFFGZHc3ZVpqSlo4ZFVk?=
 =?utf-8?B?YUoyZkVXQllDUHJUQkVPR3ZzYTVYczlDL002ZisvU2wvZUM4bkNSZEV2a0xl?=
 =?utf-8?B?RG45UVNxYVp6WFRQSnZneUZzK1VLdEpZYU1Cc3NYb1RUamVGZEIwL2hJNjc4?=
 =?utf-8?B?UitpUzVhSjBZQ1FmeElQZ3lwZkJ5QmFqZ2NXV3dmQjNVZ2RjcDZQTVh5VUJh?=
 =?utf-8?B?clNETEhYUjNZc01MaFdSUWFuNVN3ak9TSFh2di9URUlGVVczUVRCSWdtdTlS?=
 =?utf-8?B?N29WU2o1cFRCWmtrNTFKeWZsc3M5aDB5cDZPb2MvRWJnVmg3b0QvcFdkUTRV?=
 =?utf-8?B?OVhwUTVZOWpoRksvNjNiVG9nU1VmeDdueGdVTWQ1c2V5UzR3cmhGMG5LTFpD?=
 =?utf-8?B?TzFXSk9MZk1oaUxXZ3pkR1c0a0FWYXlpUVJMdGlwQTN5VG9YclJEaHVKZWpO?=
 =?utf-8?B?RUowakppK0hPdlBOcG9sSTdETEx0QVpTQmF4TW44eWEzak8rczRPbUJ5RWM5?=
 =?utf-8?B?cENQMURLSkYwYkRYcFNKSDBjZjBndVJ0UU9aUGxqZ2pESEV2Q21YQUM1WTJp?=
 =?utf-8?B?V1FvTkxac2d2SzFkbzlHakNjaUZVRndGVWN0MTN0R0xqczh2aFlwRGlka2Vu?=
 =?utf-8?B?eDBVZEo0enpSMGxZY1RSd05ENDY1VUdiT3o2VjJBTDFuZzRRdjV4VDU0dHpT?=
 =?utf-8?B?R3NSRVM4VDNmNXdHR2lEb0hERzFsSTBaWUdBU1YwNUpCZEY5R2ZaUmlNdk5F?=
 =?utf-8?B?T0RZOHVhZFBNRHdkT1RHM2hwVHExVUFVMjljL2ZXTGVSSHh1LzhsVGtOb2FG?=
 =?utf-8?B?VHl3aFFialdwQ1ZJSEc5bG51VmZQdVBkdFdUQ0VKSFh4bXZ5dHNHOVRoRC9i?=
 =?utf-8?B?MVJHdmRIRFVEVGZLUFhTN041SUxreDI0VVFJM2xBWWZmMmpjVzJLQkg3bCtq?=
 =?utf-8?B?L1ZwVDlEbXhJNFdSVmJ2cDdQdk9ybTBKSlJzbGhNVFRBdGp4QmVLT1lUWmNa?=
 =?utf-8?B?VTdPcWxxUkY1N1Z6bDFHTlQ5QXBGeTBqbjFJTHNuM0lEWGZXT0lKRnQ2c0RG?=
 =?utf-8?B?L2lUc2FhT3ZQZ0pta09xV1J0aHdUNlYya0hoVEJQNEl3Y0d5WVoyOHhPR21N?=
 =?utf-8?B?bXVrNWpNOGxhTVBJVElJMmFzaDhTVC90eWtMd1RSTStNZFczMEQzeUhlMG9Y?=
 =?utf-8?B?WGxWODMrck1jOUp2ZkxDUStneFJ1VVlBYk5BK1phTzBnczFEMlNZdXVuc0Z6?=
 =?utf-8?B?ck1OZ2d4by9PRytHcE8rMXNVWGJka1IycWt4OXBmaXhxeEVlVzNnaEcwdUJw?=
 =?utf-8?B?Z2crNy9qc2lqU3BHMU14WUYxZ1RpdTd6bnU0WHBaaDhyMXo3NEVxbnBIcXRF?=
 =?utf-8?B?TGlDY3hXc3ljb1lRWW9JTytneEU3K0xVRUNYS1FFOGRPM28zb1hBc3JWTVgr?=
 =?utf-8?B?bWF5ZVU0ajZ1cFEvS01GT1FpUzRxbDBRMlVYUUY5b0Rqa3VrUE5xOXhJcXVu?=
 =?utf-8?B?a2h4NW5Wb2N6MlVFeW0wOWpuNnpjQzZzT1BOcllzMy9zdzJSeDg4MmFzWTV3?=
 =?utf-8?B?NUNJYWJZck1uVVp0V1kwS3gzaUVyT1NxYWNWSHY5bUpVQkl0eVZrSjNXVVEr?=
 =?utf-8?B?ZFdWSWUrZzJPYW1pczNaYXhYTS9nOTJCMFhnbGg2aU4ycXJndit6YTdNeWFN?=
 =?utf-8?B?M2tqUmlYZnU0dldTcVRzamVpOW11RWpPWXh3VWRoVFdCQktzY0g5L05lRGt5?=
 =?utf-8?B?LzB4bnJGVjF6cUpMSGl0bnVmakJhYkN5VHVOdDhKOUhtMnhwOTRsZE13R1Nn?=
 =?utf-8?B?UllnZFhqZlVhSERrK0FNRFlJeDFhM3hXSktrUStwSXpCYVFCcnZQRC9tSXFO?=
 =?utf-8?Q?xjh9Obgxi0/RvC5zMiuWh45ro?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad38bb42-6b99-4a95-2846-08db26228dcb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:30:05.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnVqQvwmSAEq1qu4J+t/Clvh+cCzDxs0Y9fkdH3epoCGe0noHQseBgLsv2K+AMCmSq6GYHsgZ7JKh/zn6l+3ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7465

On 15.03.2023 16:20, Anthony PERARD wrote:
> On Wed, Mar 15, 2023 at 03:56:21PM +0100, Jan Beulich wrote:
>> This symlink is getting in the way of using e.g. "find" on the xen/
>> subtree, and it isn't really needed when not building out-of-tree:
>> the one use that there was can easily be avoided.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/efi/efi-common.mk
>> +++ b/xen/common/efi/efi-common.mk
>> @@ -5,11 +5,16 @@ CFLAGS-y += -fshort-wchar
>>  CFLAGS-y += -iquote $(srctree)/common/efi
>>  CFLAGS-y += -iquote $(srcdir)
>>  
>> +source :=
>> +ifneq ($(abs_objtree),$(abs_srctree))
> 
> Could you use "ifdef building_out_of_srctree" instead, or at least use
> the variable $(building_out_of_srctree)? At least that mean there's a
> single way in the tree to differentiate between both kind of build.

I should have added a remark, I realize. I am actually aware of that
variable and also the fact that it is getting exported, but I was
seriously wondering why we do that: It's redundant information, and imo
a variable of this name shouldn't really be exported.

Furthermore I consider the conditional I'm presently using (matching
the one controlling the definition of building_out_of_srctree) more
descriptive: I had to go and convince myself that the variable really
is set based on comparing the paths; I had suspected it might be some
other conditional, not the least because of me not expecting that we'd
carry (and even export) redundant information.

So yes, if you insist I will switch. My preferred route would be to
ditch building_out_of_srctree, though.

>> +source := source/
>> +endif
>> +
>>  # Part of the command line transforms $(obj)
>>  # e.g.: It transforms "dir/foo/bar" into successively
>>  #       "dir foo bar", ".. .. ..", "../../.."
>>  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
>> -	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
>> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/$(source)common/efi/$(<F) $@
> 
> Instead of $(source), I did proposed initially
> "$(if $(building_out_of_srctree),source/)" for here, or it that making
> the command line too long?
> https://lore.kernel.org/xen-devel/YebpHJk1JIArcdvW@perard/t/#u

Oh, I'm sorry for driving you into adding that symlink, which is now
getting in the way. But yes, putting it inline would imo make an already
too long line yet worse. Otoh I could of course wrap the line, albeit
some care may then be needed to not introduce whitespace in the wrong
place.

> Having "source := $(if $(building_out_of_srctree),source/)" might be an
> ok alternative in place of the use if "ifneq/endif" which take 4 lines?

As per above, if you're determined that building_out_of_srctree should
stay around, then I could do so. Alternatively how about

source := $(if $(patsubst $(abs_objtree),,$(abs_srctree)),,source/)

or the same with $(subst ...) or yet shorter

source := $(if $(abs_srctree:$(abs_objtree)=),,source/)

if you're after cutting the number of lines?

Jan

