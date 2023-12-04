Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CBB802FE3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646764.1009295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5xP-0003cI-MP; Mon, 04 Dec 2023 10:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646764.1009295; Mon, 04 Dec 2023 10:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5xP-0003ac-Jj; Mon, 04 Dec 2023 10:13:43 +0000
Received: by outflank-mailman (input) for mailman id 646764;
 Mon, 04 Dec 2023 10:13:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA5xO-0003aW-3Z
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:13:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4915ca-928d-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 11:13:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 10:13:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 10:13:33 +0000
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
X-Inumbo-ID: ca4915ca-928d-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+PAKSxEw/+X2LSXJyYZsM8Yb5M5Ru+3V8UWkA7U8UEZNeykPxJ6Bz7pIA8LPbuXUAxYwrRCetuL6+y9flVqaUcBely/UdqvUVEwxBUMNx6327sEQdrlHiIfie1wL9JBRx9uM83+XOifFijuCRW+yXuGcbewE0aQg3IkL9azZuh7a56fcPfYiPlodcY/AvvuHR43WQLlrSi3HcJopHViLJ8fL/722PQ2AF4ackXjIeobbFTBDq/xHi9w61g5Pdxz2hWRExnhmxhBjC66UXJRWHcU9PrXQzCcvIRHFyqbABjsmV/d6WqU0hpLHAhpzLXhNtYYtnShCUlOF5Xnc7UIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vl7m+5dptxbUpLyjIiAk8m9gzzZooMdgEF2grSjLUPc=;
 b=Lj8XaeHcOBz5fVNHnZEWDpPH0hbb+ownlphTe1FGPN4p/rXfbUMDKLhgiP3I07VCD2r1Hw81Rky0VqL1TnThTErWJ7ghLztS47c7lTCNxkCdwKzpDmVv+GR3ETJfdcu3wmA4BXGh5yDdGe1KIqHTV/+fQ0BLUX5Grtw7JDm+/+R5J8ZMG6Dz1JJIQD9EtbHhz9kR9avU/glt4M6BTHKQcQoy2gPZTPPL/Bzm4I3UvQpyYn7LfOc9gAkgVsfLqTBZL8JUZbkQO/kmprNm7E9RuqtfRkQWkFN1Q9a/U9t1lRg4jUTDzEuMXOdx5Y+ssYK501MQrtupY4ZM4M8Nv+eqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vl7m+5dptxbUpLyjIiAk8m9gzzZooMdgEF2grSjLUPc=;
 b=uzcuMOQK8FWsIqfNkULuss0J56h/uECR75UC0B8qM5Fwq0ITniG0leQoYSPNskwe+zts9eIJi5Fn3nbMZ2bB1lIRwjW5sm+H0+WZYbuDjeSzOq9i9RTlrAFWnF/sbWGFWqeKU57vPBk0ljR6DfndRJdkCqISEHEF8L1nxfANKHB4Peqr80dlSHtjKWwuj4BYWMw1l/SCaHgv1pEPb+llhE7uw//nQf/8uMN7+bjVcP7KHXWpHlEJTYkBjyTAZ5A+0g5lL44sL4moRns0jaXywFMSGONLrXw0tqu//1ReG/mDUm0qwMRvz0zxysi88sNEjEp4Tk657dGsog4EFz1gGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
Date: Mon, 4 Dec 2023 11:13:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
 <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 756ccd75-b1d2-4374-6c53-08dbf4b1abcf
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JEFlbblWMI7lAqFJHaQUWHIHIbWoJ/lJr6KGtnURxSz26WCZewlVqTeFu8c7GPZCUPYh+Qdu5uOKCmlPr8nQvb6yEkTNqmF2IV8WECkjbfbghNJD7FgBxS4OBgRf7jXHoNW8E+mSUqhuviCvTJbATgalb0HcKuspsWv3h/sIhjH1HVlW/jvDAzBbs0VSU819cSNEYH7YD1yppsRMpArfgUpYqJDuuVXI6OKyXURGyQVz2OvlCwMhZk3Q5u1Kr/aYFw3RL25sLQWywe2FN9n2/qPzF0k1PC7kwp67SPZPiO2cBgn8Nr3/3WqbqvWpuuCWkNwNEPjGoSwIefdJOMJKiKl0VktwGjN7zldXjV+yku7SyCrSvHQNfZZ3nHOrQRi5ZggRoNe5yGpP6h9qJ8zab0iCAVS/3adCZXonVoM+5Qu4Twjv/ScV0mvysNgp8aMgahgu0Lkwjau1PfgPJoX5U69EoG/NZFbx9awfuubiuhlUpqTipFjyLOJyicfS0bigEDYVV+lUWWCtYdAcEH0lnnmPZxvn9gXZy1C8/Jm7W2lZ9ukVc1PcG+pp/a9uqv8AIP5hsvsoBLm5w1cyLQei9tDqS4+ywN5Zt+lra3gy1vn+Q4RVUmkym9EUkRi0uIPHNVA5u57O1rZcMo67QE4M1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66476007)(66556008)(6636002)(66946007)(316002)(37006003)(54906003)(4326008)(6862004)(66899024)(8936002)(8676002)(31696002)(86362001)(36756003)(53546011)(6512007)(6506007)(478600001)(6486002)(2906002)(2616005)(26005)(66574015)(83380400001)(38100700002)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBjWGdyWEc1dlBJTEtoSTNzbXllenFSbkNta213Y0F5NDZkZWFyTmFXN2F3?=
 =?utf-8?B?aXpqUjNPRlU2VnVzSEVnZEVsLzZ0QnRIbUtreHY1N1hJd05lRnJjMkV6Y3Er?=
 =?utf-8?B?eDUybzMzM0RqOWV6LzA2QlJaZWtLYmZVT0NvN2NGYzBlQytqdnEwenQxTGQ1?=
 =?utf-8?B?S1NHeFVJTGtvdXIzS2cvK1FXTU0velNYNWZyZWJxNlhhZGhzMVFRN2drWnJM?=
 =?utf-8?B?WVpQNE04bjdWNVhIdEJVWGdpc0Y2V0tyRFZQWDBMZGVWN3YxaEtabkNGQVJY?=
 =?utf-8?B?RUkzRldjK3duQ1J0WDg2Q0JKeVk3UmQ4Q1IvMzFFUlZTN0UxWld6NDFhS09I?=
 =?utf-8?B?TW1lZzZsSlFLUG50bU5uQ2pKa1dDekhxc1pETDJBNXdTZUZWR0tsUE1adkFQ?=
 =?utf-8?B?V3NjOUhjTTgrNHRYOG56NDRwQnBLZ1lUUTF6a3FYR2VranpRby91ZTZnMlQ4?=
 =?utf-8?B?RWE3MDZES3h2emFWU1o5ZGoxazJFRFUvR0YzQkhydVBIZ056QWxmV0VQWnAz?=
 =?utf-8?B?SzgxZ0hXdjc4RWtPWFlQVjV1dHJac1YwZ25HSit6UWFVYVc4NzUreXI3OXpa?=
 =?utf-8?B?QXdUSXpibmdUZzFVWkx1TXBrV2hUalFzYVJHNHZkdnNZQ3lmeDBDQ21kR1VK?=
 =?utf-8?B?WXZVMk5DSENtUHJWaERMZUpvYzlUY0VJRzQ4NVN3ZFJ4c3VSVGVsVnQrOExr?=
 =?utf-8?B?OVdwTTVWbjBrN2NXWjJoMUsydTdyN05hL1RMdVFadDVBaEc2WmQ5dHRLN1Br?=
 =?utf-8?B?azJJZXlTWVp3WHY2L0VDTkRsNVRONEZUT2l6TTg1UEFISGxzTFVSOG94UmtT?=
 =?utf-8?B?b3ZPYUMwZVdsYzVIejFRRmthZWtPS1M5dXA4MXNXam9lWXRjYm9VTjdPcmsw?=
 =?utf-8?B?K3NEV2VqUTVVYUNjMHRXY3M0QS9QdjFLM1BWQU5pbVA4UysrZUR1KzQ5TEEy?=
 =?utf-8?B?ZmNTaXJ1Lzg2Q08vRmFUYnMxWjhIcnBkZnRmWTFjTThrV05mRGpBMUZUY250?=
 =?utf-8?B?cUhNcXE4TitQTWJNNzJvOEtFNXU5OHlxUGVxclZNUHZycW9RQTdVdzU0NDRj?=
 =?utf-8?B?MlZ1bmxBNjFvVEd3aFhObGV4S1A3aGZmMlpJS1pHZHRBR2tTcjY5Y1RqZm9q?=
 =?utf-8?B?R28vRm9Vemh3LzZSMWVJbmhGQTd5VW9uM3VyaDhydGtTL1M1akN1cFQ3dDdR?=
 =?utf-8?B?WENienVqL1JlbEJ2NWdEZVdnYXlKU2NHNmU1VFV0TWRoc3VLK0lKbU1aOWRx?=
 =?utf-8?B?VW1peGhvMUx5Skl3M0NKZ2dEWEJVaEpVSHEvY0VmRlJ2Yy8rdTV4SEoramRI?=
 =?utf-8?B?dXRRV1NKckRWbDhjWlF3Z2h4cXlocHdMNUoxcWc3L0JJY2cwM01CZ25uUi94?=
 =?utf-8?B?Nm1yNlp0MWM4ZE11cG82N05nL3lLaEZnUy9uRC9tYjFqWVkyUzJNZUwzeEhl?=
 =?utf-8?B?U1lNWEhPcTN6cGpwOHdMaE5KZGFzV3RpbkNzb3h5bVZUSU1wdHQrRTQramcy?=
 =?utf-8?B?dWRINkQvSG5EZkhRL1dVWUplYjVjM1lZRlZubEM5R3k0bklhMnRqZWQzeWMv?=
 =?utf-8?B?bEtjRHdQOGx0dFBMckpPcEF0SDBaZnhCV2NqRGdraXlQU1lqcWZ2RG9wWHQ5?=
 =?utf-8?B?eStSQTdQaXRIME9SRG5kYjVRSWNpU3RIZHlTRWc4Q29lMGhWZlUzV2E2bjBM?=
 =?utf-8?B?SG5YaDRnSTRoNTRuK1dDQ2VLSG4xMWZDVXBWNkRsdThEMjVCVmlockdUbGNC?=
 =?utf-8?B?RmhGbjJTYk5WRUhvSFBhN1JBVng5dG9xZHkvVWVXSG94MXBueStHS2ZhV2pU?=
 =?utf-8?B?aW5NQWt6bCtuM1RZYUFwNFZ1c0xDdVlXZiswSS9sYk9rbFBFL3J3SFJJSjNV?=
 =?utf-8?B?YTVtblgxOVJteldhVURjTldQZ20rb0dkazVWT3dwTk9OVXB1eDU3RjF0NTJ3?=
 =?utf-8?B?OUZSV2F2V3BNT1VWM0l1Rk00bTlaZFppOW5zdE5LM3k0aVpYTWpYdWNpLzQ0?=
 =?utf-8?B?K0NObkpqZlBDdTJha2ljUHYxcnZqZDJnQnBNWTFrLzFrWUVSOUhQOEZzb2Ix?=
 =?utf-8?B?U21zem1SM2Z3NHd3K1ZXK24yZ0hIVEpKSklUdjgydUIvck8xTEcvc2JWQkxy?=
 =?utf-8?Q?uW90TIsGV1MDm62Owx/zWuZuC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756ccd75-b1d2-4374-6c53-08dbf4b1abcf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:13:33.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fQlg0yCPT3j1YAyV8NYZOcwtVA4PVGxhP5qlaDfb8uZVKmg8VqPOzaERt4xo1nLoPfOEiMdXJS8L+nE1JvVNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9287

On 04.12.2023 11:02, Juergen Gross wrote:
> On 04.12.23 10:15, Jan Beulich wrote:
>> On 01.12.2023 21:12, Andrew Cooper wrote:
>>> On 01/12/2023 7:59 pm, René Winther Højgaard wrote:
>>>> If I set smt=off and try to configure cpupools with credit(1) as if
>>>> all cores are available, I get the following crash.
>>>>
>>>> The crash happens when I try to use xl cpupool-add-cpu on the disabled
>>>> HT sibling cores.
>>>>
>>>> Hyper-threading is enabled in the firmware, and only disabled with
>>>> smt=off.
>>>
>>> CC'ing some maintainers.
>>>
>>> I expect this will also explode when a CPU is runtime offlined with
>>> `xen-hptool cpu-offline` and then added to a cpupool.
>>>
>>> Interestingly, the crash is mov (%rdx,%rax,1),%r13, and I think that's
>>> the percpu posion value in %rdx.
>>>
>>> I expect cpupools want to reject parked/offline CPUs.
>>
>> While the only explicit check there is
>>
>>          if ( cpu >= nr_cpu_ids )
>>              goto addcpu_out;
>>
>> I would have expected this
>>
>>          if ( !cpumask_subset(cpus, &cpupool_free_cpus) ||
>>               cpumask_intersects(cpus, &cpupool_locked_cpus) )
>>              goto addcpu_out;
>>
>> to deal with the situation, as parked/offline CPUs shouldn't be "free".
>> Jürgen?
> 
> The problem is the call of sched_get_opt_cpumask() to need the percpu area
> of the cpu in question.

That was my first thought, too, but then I saw cpupool_assign_cpu_locked() on
the call trace, which is called only afterwards. Plus sched_get_opt_cpumask()
needs the per-CPU area only when granularity was switched from its default of
SCHED_GRAN_cpu afaics.

Jan

