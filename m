Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF1621990
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440296.694448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRZ8-00073G-H1; Tue, 08 Nov 2022 16:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440296.694448; Tue, 08 Nov 2022 16:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRZ8-0006zs-DY; Tue, 08 Nov 2022 16:35:10 +0000
Received: by outflank-mailman (input) for mailman id 440296;
 Tue, 08 Nov 2022 16:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osRZ6-0006zm-MB
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:35:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e191f72-5f83-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 17:35:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Tue, 8 Nov
 2022 16:35:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:35:05 +0000
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
X-Inumbo-ID: 4e191f72-5f83-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKvMYRnztCvAET9KoQIMpNRioeYRYhoM8QmryUQHby6Epi7lxKkRncrsa63t2Ul5tC5fpaLtgtl7MS3d3tmuTNweON88AcAKhE7j0Ksj0Do66tM6Z4Iu6DF2TdgDDW9OLkX8xkagUimobWoyEwWZplnuKrUEb9zw7Y220aP5cxl2pxhW9oC6CiyZOMkIRKPwvZUCPzrrG8W0NkqBIftp8qlAjlsIzeW6Mu5KQFx5WQp62aA5y15E5FthOcQG4N9OoaMH32+yqpvfybNARfu0q1mXktTMSXcSt4APIrMc0/qZHdLIQlXSXw2+Ele60R4QtF2s8ujwmrBcCARmen2FWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X81JENs+ZcCQ4hybFqC+u7Rl4nKRoAKqwk0u2mU7gNo=;
 b=jnbiI6o1+1fPXBor85Q8s+HN/2TCGu4QUtu6zx9qs9oUCWXJ3GNR/SRgTrvK/qIsqsrEynm5Qiv6fAekhMXiBghA0/6lqzb3usaWfHF9HwTRBxGt9gjrXs/BZuMjW8dwMVdN8tunksiXR9bZzfUeW8YYMoFvPdWPQqIC7bP9AvPICCnHTfMFyMxQ85TvlaVhymzGIlbpWJHV4gpC/B8BETa84AiEVzqgfJHAOaFPazNpqlbKNT+d1yzyJQR2RYzLhRjDSxl1gyLAXvnpOr3WgIaiqESMEnfTAMps2OXtus1Qu/Qm5uanzry/nITzUtBQjHAMGNrLK0Im+sAF7/LgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X81JENs+ZcCQ4hybFqC+u7Rl4nKRoAKqwk0u2mU7gNo=;
 b=QAobF46TtDr8TYDlHW8Q0QgVUXIcNIuYqdj19tUeG0nBV6IErZSKqrGqEvIRH4jBAUjU1aeCU1kSkfFeGsAKynj3ECGnj+zXpKiqhm8A5/MxV7PhrxgIWwKfOUiwv2qJLyuJJaCvb34pnQLxSAGHQXydeNtDGuoB5HNxJOv9jK74aEy6D1wgSLls9fTSceuzdhxxAXo0LvJktPDl06lF1/KChNotPWglTUvbNV/kEKvSPnqNhs4ttmFqXstKNiXleIdASOSx53vpYrQqo3M2pMTNenvXxN7QPtyVW8PmsiGwI+BZeyncjVGOuMRxmuk7JoBQEXce7TyLuNHKCBdHiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b129ba0a-73a0-9a2b-015f-2eaa1011b08b@suse.com>
Date: Tue, 8 Nov 2022 17:35:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/pvh: report ACPI VFCT table to dom0 if
 present
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, ray.huang@amd.com, Alexander.Deucher@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221108135516.62775-1-roger.pau@citrix.com>
 <9b785cc6-2de1-a522-9e57-62c0421c6a21@suse.com>
 <Y2qERaoix1Ff4yZA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2qERaoix1Ff4yZA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0136.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1472b7-aa7c-4235-19c4-08dac1a7313e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	15E/ZOnPcyDRRpH5pRGvmDIZqRBQuVpSnQ+wbkz882XQ2yK3bNzydsHRVEkDKEQ5opNGySB1u8kHmCMSr/lduQip1qkL/1QvsBNAiD3qXti17+NlgQBbhAH4BY+PSsRLKpkt28Yz4EXLdcA1fyh8NXgNwjsnOBk7Wd3hoQWUDR0Q+Iensezn5VVoxjQerUR58wUBODb2+06PwpR9YDJzDrXZfhVBtJ0GNjtIlTHPs17370WHiwePmoRO+fIjUIw0le/5JCKL53CvIsm26gUQeexMBHS4v03/0FFKQs7g502XCPBfCKp7nrIxUVxgbppUOV9nyNXJ4iLAvKLXAa1r1JoaFiNOZ+ItAWob8S1AuLgdA8wNY6/ActoTV0FhrNcmGOHjRfrP0+iM4NPtXsjYGc3lzTFF8ucOxE7ZmQWH6bQoEh+03qj748CUfkn3mv+czmvZVbJ/YfI5zXmUEqKkelG/K8PetL3GRyOPMjucQqt5C+pBcWztRWYwFfGBYgws7NYgkzDggHV9caTxULzecODLEurdM9UrO8I+5j2lIkxHGJS6WjjoL1Slodynw3fytZACGmUyJ0Mbh1xNA8KSuPMGjinA0jExKw2soI4Mf8vGeHnsU2fd0MHLOwzpRw3z15HXwlGHhJR0fEgBwyggCyd1NfgRIhPm5ikWh4n0wMsaJ0DiHYNxFgO6a6yHuRmnCuksj68/3jenkynJoTvPcifpiIh9VrhDEAjVJirw9fuI9Hjga7rwL2dpBkHBYRAZA31XA5YODWXpmfDE3LgCCZvx2OjfbGxPdEAzCNqqym2Onrn4aP/xGUGCZu6cEZrs1x64fpwqUefCzocr6qPwZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199015)(86362001)(31696002)(66556008)(38100700002)(316002)(66946007)(4326008)(53546011)(66476007)(2906002)(8676002)(5660300002)(6506007)(6512007)(26005)(478600001)(6916009)(2616005)(186003)(6486002)(41300700001)(966005)(54906003)(8936002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFI1c05TYU8rTVBkUFhSVFJJbGppQ3ZSUnFVTGtWdHdDdFpTR1U5bTRJVys0?=
 =?utf-8?B?d1lNaEdmb2JtYzVodEhuRXg5Z3RJc3l6ZnlFamZ3VnNOVWRFN3NKSG56VmZD?=
 =?utf-8?B?cGVXa0p5amVRWUZ5UnNpeElUM0NUbE9LM0J5bmRwS04rU0pQSE9pbkR6REFL?=
 =?utf-8?B?VVc0WWtub3VRM3FOVEVPMFVheExlbnV4WlZjaHN2NFJqQW1hejkxdjFLU0Nn?=
 =?utf-8?B?TktCM00vZ2xXTFFIQ2RuNzBOVCtnWlF2UGhKVjN2N1NxOGlHVEM2S1pFSUVC?=
 =?utf-8?B?Rm9CTjBiSGZiQzd3WHNYbUN4TGwvL2pMWkZ0blh3cUVZMkFhMmVFTm8yb1dh?=
 =?utf-8?B?dVhQcGVtUktWOUxWbTN5dkNteFlKTHVGT2k5azBDUWVncmNrNldRREFiU1h6?=
 =?utf-8?B?a3IybXhQRWcvN1g3NEhBaG9JbmVMKzR5bVpkZWM2SHBKSVZ6SWNLdHZBYktB?=
 =?utf-8?B?Smx2dEx3dy84NG1iN3ZiOEVSa095b1U0VE5HemxNOUlqVCtYUXhXaUREREpK?=
 =?utf-8?B?MXFtVG9CTWVjK002YjdGUUlZaHlOOHNGOU1kck9yeEFJZjFSOFUvcitrcm01?=
 =?utf-8?B?VkNiK084bklpVm5wR0pVQXB5S0lua3R0RUZCSklCVEV4d1pSY0I3LzVTblFj?=
 =?utf-8?B?QnNURjhyQnNNVHhWWFl5cVZ6Vlc4bEFrMFQ3c0JmVDB6ZXBHV3dnTyt6QXdS?=
 =?utf-8?B?dkVFM3VmUDhSTm44Z2o2OXljT3NJdnBGM2Fqd3dpWG9EaVAwWmc1cE42VnlJ?=
 =?utf-8?B?dTlqL0N6SHBFMVFpMnRXRHd2dTRub1doRG9zaENUdW1tQVllVnQzbXpiLzJR?=
 =?utf-8?B?UE0yUjZmL3o0OUpCWFlmbFNyTFFiTmZxM0djNFh4bGJ6STlPam1uaVBEQnVq?=
 =?utf-8?B?OGRzNXIwem1KRkdUNjNYM0NmWDlHL0VVOE9QQUFHaXZ6K3VGeTY3ckZ6bVl5?=
 =?utf-8?B?dzR2SU9FWDRjdWJXRk1kai8wYWhoWUpEVkpLdGlvcUYxYm8rbWJmajMxQkMw?=
 =?utf-8?B?cW9JM0Z0MFdaZEpVZVBaeHJnMW12b2Q0UWI3TDBHamlzZTJlU29sb0VtZVFT?=
 =?utf-8?B?L3k3d3BBa1F6TFVldmNZeDExdGx3c0k4ZGVwQm5XZmp6K0NQOTk0bThjb05P?=
 =?utf-8?B?azRJV3hpRDJ1d2h3TzQ0VG0rRjFSV1FWRDE2RE5jOTZ2MjVhSmZNK1hNWjZp?=
 =?utf-8?B?N2NuUFBkVDFiUWZmS0craFZaVGVFT3BqMkhYdDRQZk9aTE9GUlZPeU5IZmRu?=
 =?utf-8?B?cndzQWRzekVuaEkxUDBZRjQzRlBCSWoxL0JmTzRzTW9sQ241aEl3ZmhVUUdD?=
 =?utf-8?B?TUpUMnJmZ0V6OUZWOStEbC9NY1JtZ2srUjlnV21HN2NFMW9IWWM2bkc5UHJs?=
 =?utf-8?B?UzMvdjRodC9SdlVQbWl5S01Gd2ROa21aRVFvaGpsNWUwY3hPSlRObEpTMmNN?=
 =?utf-8?B?MkRFb29Pa0lyVmVVRXI2dUpwRDNxSUJLT1l6L0dXK2NOVmpyR01tRnpCaCtC?=
 =?utf-8?B?aGhqa3pwOC8zNUxBY2pMS1ZrcTljcWlzZXVWN1J4cmRUWWYvV2VNbUV2RDFz?=
 =?utf-8?B?NkY3bENzQkxBWGpTeFZIY2RKSWlvTU9iR3VOT0w1VHNvNzUrTkpPdjFqTXNH?=
 =?utf-8?B?OXRDUnhJQy9kU1pETnhFc3NmVXI1cDFOTjRnZXRpdEhXMnhXWWRIaEd3YlRS?=
 =?utf-8?B?aUViU3RQOUYxRElJWkR4V3VwQTJEd1pnWTdCYXJyV21lc29vc2tvNFlYOXQv?=
 =?utf-8?B?aWpxU0tPeEtCQkpUY1U4VmhSb2xhLy9kQ0dhVWRGeDhpZnVSRTYrK21XNE5X?=
 =?utf-8?B?allIQXZGOWJ1QjNTZlg5bE1pei8rL29GMERLNEhpV3A5RWhXTnp2YnY2ZG10?=
 =?utf-8?B?WDdnR3hRV3JpRnBmNkFPOTVZVnU2OXVzb3dIN0VjQlJoWHo3dVFFWHZVQ3Yz?=
 =?utf-8?B?Mm5kSWx6RStyQ3AvclUzdGM3TlhWNFpIcVRhQlVQVW0zQXU5U2QwSmlSQjlN?=
 =?utf-8?B?NjFoei9EbHQ1b296SzlML3dtWTRyUzZqTlpCcFhObEd1V2NwQlNITzkzMzhN?=
 =?utf-8?B?Y1Zib3RhVFh4NGRmQTVKL0pSeVJVSDFhUitJaVBzRTBGWHRkSStrc2JiZ1cx?=
 =?utf-8?Q?kYVCaLEqaHEbE8AbO4LBXjmi1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1472b7-aa7c-4235-19c4-08dac1a7313e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:35:05.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5FjzbOlkJ8THjw/xKEEaGZMlz0/HKddRI2iAzfMolXhKaD8L19U0RIcH+PXJ/K0Sa9iLWbXmxiqRgu3jcYWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

On 08.11.2022 17:31, Roger Pau Monné wrote:
> On Tue, Nov 08, 2022 at 04:56:17PM +0100, Jan Beulich wrote:
>> On 08.11.2022 14:55, Roger Pau Monne wrote:
>>> The VFCT ACPI table is used by AMD GPUs to expose the vbios ROM image
>>> from the firmware instead of doing it on the PCI ROM on the physical
>>> device.
>>
>> I can't find any mention of VFCT in the ACPI 6.3 spec, nor anywhere
>> under Linux'es include/acpi/. I don't mind the addition that you're
>> doing, but there needs to be a pointer to a sufficiently "official"
>> spec.
> 
> I've also asked for some kind of official spec, as I would assume it
> should be in:
> 
> https://uefi.org/acpi
> 
> With the rest of tables not in the spec itself, but there's none.
> 
> I could add a link to the Linux header, but that's suboptimal IMO.
> 
> Are you fine with this as-is, or would you like me to elaborate about
> the lack of an official spec in the commit description?

A pointer to the Linux bits is better than nothing, but as just said
in reply to Ray there needs to be sufficient guarantee that "VFCT"
really isn't going to be used for something else down the road.

Jan

