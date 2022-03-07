Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5174CFC8A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285838.485100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBPl-0006rc-9I; Mon, 07 Mar 2022 11:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285838.485100; Mon, 07 Mar 2022 11:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBPl-0006p2-62; Mon, 07 Mar 2022 11:20:33 +0000
Received: by outflank-mailman (input) for mailman id 285838;
 Mon, 07 Mar 2022 11:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRBPj-0006ow-5t
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:20:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96cc2769-9e08-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:20:27 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5--i12SI7YOjy4DbDywLr7Ew-1; Mon, 07 Mar 2022 12:20:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4057.eurprd04.prod.outlook.com (2603:10a6:5:25::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 11:20:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 11:20:23 +0000
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
X-Inumbo-ID: 96cc2769-9e08-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646652026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wucVCDQ8TARid7Lanbfc55k9ZcuwKJSQiQAzawWrSos=;
	b=meYMYTH+/3TS25ZxB8QW+p87Jak7DVPby8HxPiOrngXb25F3760CPNepJ1TrmSY5DGNF4l
	TVWyRl79icawG3/O3i8YrW+XQdA2HDYEfDiB50tmf4Hfs9RE5dF8XpeIncsprAL7W0FDC0
	5HXIVwtxe6b9vU1ZiIAGHlRIUJXGKxU=
X-MC-Unique: -i12SI7YOjy4DbDywLr7Ew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJoyQoVdIwCq/OlnViA84af+L8GuGHtlt/pkIB/mCN8GIZywxhVwqqoyuBkEhMDuqfvMX+VUFtms67GjBt+f75ImKOTlNc3lSO6+MotN+r9ix6HMNp5ioY8NZdEsf6kmKg16DM33Dis34oseUuAKAfjz+5fWy16FPvCaSuEXq5uDYQsIraSdmISkHtzcsksCrjJ25VflGBGJfUjBadyPJO2KxjCbiaQQTQlkdrGVqSmOUmlgHUewrKptd+vrcxU+Zb7dQ88jUgUXEpwksgDVTAFuOgXRl70kp737TK+keLfbP1nD+ZsjqrNMR9zFF8uRzuBalZIFBHlm/sfHp8kekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tZrsaSs50EP1Q6IaDDjjL7iNRX2q5WoxhQFue0olIY=;
 b=M7kfaKf9nxMJTBjQACqguOsrTjXkJEa26SntIVB0M6AWwOkZFkI/OAiO+dtpzLszwNRyLppXP01KaarddbbduCUQyVOwp9cDZ036QVjg0vHYNMD/amFojUdu3vuroLVMJceArKbeZqpipxrs0Pg22WCbow6QatUkuolW7GKaPgxVpE9YePGuilt0Mc8Ix57BnJ9OZkg0nEZnXBGnfg9UWWqcrfKNl3sqwRoiir55XhirRZbz4nJ/cE1/0eLLNgohj6l0i0GYOwfg1CSpUWPb6QMnoVbd/S4jqXo8eluuIOJl9VPSCWJM2cDkYEZC504UqIMm1JozXOP/KE3TTy3dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b36a549e-4446-8164-bc4d-f132cac1cde2@suse.com>
Date: Mon, 7 Mar 2022 12:20:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
 <YiDaQY1ToO8G2QYd@Air-de-Roger>
 <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
 <YiHZpmrYt+QvE7ex@Air-de-Roger>
 <2ebf82d3-3509-7224-6537-acdaad34dcf2@suse.com>
 <YiXnKvqX1FGyhzmy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiXnKvqX1FGyhzmy@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0346.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac8f348-e783-4279-771e-08da002c78ef
X-MS-TrafficTypeDiagnostic: DB7PR04MB4057:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4057074AC9EEC6B74B849F77B3089@DB7PR04MB4057.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f79QkiiOc9eKv+YlQDDHaTg7YCmqE8s0AXTYONp99Cuaft+uANELDWZnTBvWujgYcCub4kEuepwDhFHS40otQMdqonNCQ+G1eJZNipkqAadYFcB0Qdu+5r2XxWxz2IYf7hwv6mH0JLauR8tWnYrrnNV+N9UgAJixvyW/az0yn8ok8xB4IA6TUqziOLhGKvmVj/N679dJIV3bEsLgsjAy/kFKa/Ck0k3Je9jKX8MWs9UjwAxofhKgIpYls9/mEtItYmwUfX8kQHh6uLBoS0yH6lIAqMZ5XFzG1FKu5U2iF0qxRJNm3fhlwawpEFrU7sBt5I0UpiVu8SkvONgInXiGLFYMk1X5ndyn8KTZjqTkoXxZntWrib/1HNN2x6UHAI300puejyOp2HvkvmyTrhBCCflfq0+BgLCUSkJAYIsja58SWpHNtcevY+LQKvIbJ/Jgs0kZ7UN0ExD/Uw7WEY5Rp7qFvpvOsF8wL6Pj+HhUjX67zBlWAO5Sq5Tx0P3f1VmWyxAirIXou69YImq85wN5CI4gv7gpb3B3ZvRjtmgpEjmYqexJiiYxgVrZ1RId3myjXNJE6E796riB+Pf4+mT+MkNOWkAjlsE057/uVF2c6nRwsnjUpH85qCwUd2SWFrTJnWaqgYyCPlmY88dX18ey1aU8l7mskWeIUOfgFyYEGlLHOTFrwluN5fata0nqibFdfqGF+znz60Egb1ElWqfdPEiM5sQwPlOTkGRkScwLce73vTuMw+DqUrDdpBS/nXDPUok5j9ZC7vRDPe1zKfOM75P9wshEKndBRM/6ES2GWQ+lCN1SLgWuZDg5wsTUVwRW5/Y31OVELtAc06OdjoOSR4vmFVpFYz004Dbr+16u6hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(2616005)(2906002)(8936002)(53546011)(5660300002)(6506007)(83380400001)(86362001)(31696002)(66946007)(26005)(186003)(4326008)(31686004)(966005)(6486002)(54906003)(8676002)(6916009)(66556008)(316002)(66476007)(508600001)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YhhJZgIM1yIyqwJuNodARZa32Y/3D4QRsEw8oIa14tpeIxPdPe+6Mrfv50J0?=
 =?us-ascii?Q?Qwfovdq3Ux1JG92cxHTrz9sX1a2cANrLyUZR+qT4bTS+dXJh++IY2Qn3p/ok?=
 =?us-ascii?Q?L9YMpDIus7Gs5nFHv2FYoonMT1mnwR9mk/Va9deqd3nUClvs6tjirpSTO6/X?=
 =?us-ascii?Q?33wVmU+9+CDEnlK5Q3hiVFbDY94tKIzavUOypLrAPfog8fIGL7Xd4aWNlABH?=
 =?us-ascii?Q?BBmKDFYjOvqsbAbj592x0q13ataeOrpuZvc5MuaPQA1oLUk/2rRy2xj8h+Tk?=
 =?us-ascii?Q?VXGLXQcG1F+m8WnCtDsGRJbqsr/y6auSEY244LbH+oxMy2+dTGgm9e7md0/G?=
 =?us-ascii?Q?HBOy3Yjlh7FiE63l4QdkJDgtKAq8nwjb8YVX4j/hsxZxI169TCet/jjHS0AD?=
 =?us-ascii?Q?sHh0Bio3WW2ueuiFcVkQU9SRwPXn15Q+JDuq4Aeokomn23/4h//EL6+tl+Y8?=
 =?us-ascii?Q?cMiFlpv5wy3VBaErjjUBSsGubIMc3wPPT5pV+Y1abXD9hiXLDoOeUFjkoJbt?=
 =?us-ascii?Q?Aj1/NBFMJVXGECdrDQnUbNndiPQ3ZkAZSq8bDLt4axYarN+2j2eCh1IkJBSw?=
 =?us-ascii?Q?NXn/LkcHCXS+x9Jw31i4oUmXqX+gcQSx4Eu145Ss1DRY3jxhoRUD1jZ3Zan2?=
 =?us-ascii?Q?9pmv4Pg2dglhODi0TiFyzX3NC4Gn54fzIwZzZ/GQT32A0jDix6ZoBGHuqRhc?=
 =?us-ascii?Q?q0qf8hS56mXarBnri9PKNz+6eE3DXi84N6c2HBx+1cf5WnjbsB/Es1cMUOHx?=
 =?us-ascii?Q?tE9zr8Fz76n8/TDsOrIVlXGPq2CG5SjSm1ZBsQPCE99tFwQUk+UvlGVDiG3E?=
 =?us-ascii?Q?ekBLYgcqUqqNRCpDpRTde/M0IGym2dENnf1nwotpQeLe4mwtCusy+TtQt6yu?=
 =?us-ascii?Q?I2UM3LAqXbjE/wKMda7Q8HKIPgRUDiSxvjTR46Mj5U9+d6bg79wPDB1+hnEk?=
 =?us-ascii?Q?0fn3p8PeEe1TsiT6rLYtRMsqcRaiA8g+lQTQ83tLLo72HgVDQexUNIFnn2zA?=
 =?us-ascii?Q?26VaN39vR2xx7ima2pC8zC942NsJWKfKImhllPFGRmphYaTDXLnu5czuQd21?=
 =?us-ascii?Q?p+kHpGYOyLvwYmDVfdHGvXQAzyShYNLmTHpKJeCY9p5xFGwUgfhD0WRiUelG?=
 =?us-ascii?Q?EM4lP+8oaNG9AMXKiXuLxwpFXAFrp3Kl8YgnIGODXIBiKHIUjA3xyB2jPiAZ?=
 =?us-ascii?Q?l7kCDyE3X/5fKyffFZmmYvHzncpmCvih0IPXrWbD1NI75uCnvz69sWMgDWBZ?=
 =?us-ascii?Q?AgwBEU9j+xgHTPy9JAojoUhhSXiJPAU/rVXPE50L4H0WhmoABDC3A3acttTt?=
 =?us-ascii?Q?anKhmLtkVOo4vz9wYtM5VZa9Pmty2yD4UU4nRmsLjciRQM5HbR0l+/F4emVv?=
 =?us-ascii?Q?iWe6XYCkDtYVsm00pdLXNcuiU2o+8yQVWn6YYcTnjG6MoMK0hsYXJLCJe9S6?=
 =?us-ascii?Q?TRS/DNwlfmYJmnkiUrWwPr9PU8SCCvduWHuM6VXUMeV7iZxwlpNT5KG9eyEm?=
 =?us-ascii?Q?rTITSZhCkQk6bBRdLSfYX13JigTacnVnc94KQ61ND7/47GGTjLnjZ/BZxQf7?=
 =?us-ascii?Q?hFr3A4f1uuFnsCLX3PxdmIKktIJlwXew7gaB1b2FqgKqzSCsSYq2CbgsOu0Y?=
 =?us-ascii?Q?7AIVaBxnq19oRWWrk8cq5NA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac8f348-e783-4279-771e-08da002c78ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:20:23.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2jkvmxWTl78j7sjkCnJ3dKgwP36+AQ8N6XlKttOTvT4zv/cgCDTPdvOXd4kEt9hDR8qsbcFQoiwgZJ6BE1UNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4057

On 07.03.2022 12:06, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 09:18:42AM +0100, Jan Beulich wrote:
>> On 04.03.2022 10:19, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Mar 04, 2022 at 09:02:08AM +0100, Jan Beulich wrote:
>>>> On 03.03.2022 16:09, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
>>>>>> On 03.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
>>>>>>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in =
final
>>>>>>>> binaries"), arbitrary sections appearing without our linker script
>>>>>>>> placing them explicitly can be a problem. Have the linker make us =
aware
>>>>>>>> of such sections, so we would know that the script needs adjusting=
.
>>>>>>>>
>>>>>>>> To deal with the resulting warnings:
>>>>>>>> - Retain .note.* explicitly for ELF, and discard all of them (exce=
pt the
>>>>>>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
>>>>>>>> - Have explicit statements for .got, .plt, and alike and add asser=
tions
>>>>>>>>   that they're empty. No output sections will be created for these=
 as
>>>>>>>>   long as they remain empty (or else the assertions would cause ea=
rly
>>>>>>>>   failure anyway).
>>>>>>>> - Collect all .rela.* into a single section, with again an asserti=
on
>>>>>>>>   added for the resulting section to be empty.
>>>>>>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang a=
dding
>>>>>>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counter=
part,
>>>>>>>>   .debug_macro, then as well (albeit more may need adding for full
>>>>>>>>   coverage).
>>>>>>>>
>>>>>>>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>> ---
>>>>>>>> I would have wanted to make this generic (by putting it in
>>>>>>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
>>>>>>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
>>>>>>>> LDFLAGS would mean use of the option on every linker pass rather t=
han
>>>>>>>> just the last one.)
>>>>>>>>
>>>>>>>> Retaining of .note in xen-syms is under question. Plus if we want =
to
>>>>>>>> retain all notes, the question is whether they wouldn't better go =
into
>>>>>>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and whe=
n
>>>>>>>> notes are discontiguous all intermediate space will also be assign=
ed to
>>>>>>>> the NOTE segment, thus making the contents useless for tools going=
 just
>>>>>>>> by program headers.
>>>>>>>>
>>>>>>>> Newer Clang may require yet more .debug_* to be added. I've only p=
layed
>>>>>>>> with versions 5 and 7 so far.
>>>>>>>>
>>>>>>>> Unless we would finally drop all mentioning of Stabs sections, we =
may
>>>>>>>> want to extend to there what is done for Dwarf here (allowing the =
EFI
>>>>>>>> conditional around the section to also go away).
>>>>>>>>
>>>>>>>> See also https://sourceware.org/pipermail/binutils/2022-March/1199=
22.html.
>>>>>>>
>>>>>>> LLD 13.0.0 also warns about:
>>>>>>>
>>>>>>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
>>>>>>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
>>>>>>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
>>>>>>>
>>>>>>> So seeing your mail where you mention GNU ld not needing those, I
>>>>>>> think we would need to add them anyway for LLVM ld.
>>>>>>
>>>>>> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
>>>>>> pre-processor conditional keying off of __clang__, as that used as t=
he
>>>>>> compiler doesn't mean their ld is also in use (typically the case on
>>>>>> Linux).
>>>>>
>>>>> Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
>>>>> but I don't really like matching on human readable output like this.
>>>>
>>>> Same here. But Linux'es ld-version.sh looks to be doing just that.
>>>
>>> OK, so be it then. We can always improve afterwards, as I don't really
>>> have any better suggestion ATM.
>>>
>>>>>> I also don't want to add these uniformly, for now knowing what
>>>>>> side effects their mentioning might have with GNU ld.
>>>>>
>>>>> Wouldn't it be fine to just place them at the end, just like it's
>>>>> done by default by ld?
>>>>>
>>>>> Are you worried about not getting the proper type if mentioned in the
>>>>> linker script?
>>>>
>>>> I'm worried of about any kind of anomaly that could be caused by
>>>> mentioning sections which a linker doesn't expect to be named in
>>>> a script. That's hardly something they would even test their
>>>> linkers against.
>>>
>>> I've raised a bug with LLD:
>>>
>>> https://github.com/llvm/llvm-project/issues/54194
>>>
>>> To see whether this behavior is intended.
>=20
> Got a reply back from the LLD folks, and they consider the GNU ld
> behavior quirky. Linux linker script does explicitly mention .symtab,
> .strtab and shstrtab:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da840c4de56
>=20
> So Xen should be safe to do the same.

Ah yes, this is good enough proof for those present being (sufficiently)
benign to GNU ld (and being able to expect that this isn't going to
change). I'll get these added in v2.

>>>>>>>> --- a/xen/arch/x86/Makefile
>>>>>>>> +++ b/xen/arch/x86/Makefile
>>>>>>>> @@ -120,6 +120,8 @@ syms-warn-dup-y :=3D --warn-dup
>>>>>>>>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=3D
>>>>>>>>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=3D --error-dup
>>>>>>>> =20
>>>>>>>> +orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D -=
-orphan-handling=3Dwarn
>>>>>>>
>>>>>>> Might be better to place in xen/Kconfig with the CC checks?
>>>>>>
>>>>>> Well. I've tried to stay away from complaining if people introduce
>>>>>> new tool chain capability checks in Kconfig. But I'm not going to
>>>>>> add any myself (unless things would become really inconsistent) up
>>>>>> and until we have actually properly discussed the upsides and
>>>>>> downsides of either model. Doing this via email (see the "Kconfig
>>>>>> vs tool chain capabilities" thread started in August 2020) has
>>>>>> proven to not lead anywhere. I'm really hoping that we can finally
>>>>>> sort this in Bukarest.
>>>>>>
>>>>>>> I'm also wondering whether we could add the flag here into XEN_LDFL=
AGS
>>>>>>> and EFI_LDFLAGS, as those options are only used together with the
>>>>>>> linker script in the targets on the Makefile.
>>>>>>
>>>>>> Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
>>>>>> the respective post-commit message remark.
>>>>>
>>>>> But the calls to LD in order to generate $(TARGET)-syms do not use -r=
,
>>>>> and are all using the linker script, so it should be fine to use
>>>>> --orphan-handling=3Dwarn there?
>>>>
>>>> But XEN_LDFLAGS is also used elsewhere together with -r. (Whether
>>>> that's actually correct is a different question.)
>>>>
>>>>> Could we do something like:
>>>>>
>>>>> $(TARGET)-syms: XEN_LDFLAGS +=3D ...
>>>>>
>>>>> And similar for $(TARGET).efi?
>>>>
>>>> Yes, this ought to be possible, but would again lead to the option
>>>> being passed on all three linking stages instead of just the final
>>>> one. When there are many warnings (e.g. because of the same kind of
>>>> section appearing many times), it's not helpful to see the flood
>>>> three times (or likely even six times, once for xen-syms and once
>>>> for xen.efi).
>>>
>>> OK, I think our build system is already quite chatty, so wouldn't
>>> really care about seeing repeated messages there. We can find a way to
>>> generalize passing options to the final linker step if/when we need to
>>> add more.
>>>
>>> I'm fine with doing the LLD fixup as a separate patch, so:
>>>
>>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Thanks. However, something is wrong here. Unlike in my local builds, the
>> pre-push build test I did after committing this triggered a massive amou=
nt
>> (tens of thousands) of objdump warnings:
>>
>> CU at offset ... contains corrupt or unsupported version number: 0
>> Invalid pointer size (0) in compunit header, using 4 instead
>=20
> That's weird, I wasn't aware we had any objdump calls after the final
> image is linked.

We've gained those recently, from check-endbr.sh.

Jan


