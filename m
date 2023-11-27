Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215CC7FA561
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642309.1001675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dxZ-0001KH-9F; Mon, 27 Nov 2023 15:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642309.1001675; Mon, 27 Nov 2023 15:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dxZ-0001IM-6W; Mon, 27 Nov 2023 15:55:45 +0000
Received: by outflank-mailman (input) for mailman id 642309;
 Mon, 27 Nov 2023 15:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7dxX-0001IG-I6
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:55:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a742056-8d3d-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 16:55:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 15:55:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 15:55:39 +0000
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
X-Inumbo-ID: 6a742056-8d3d-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHrySxGXN9IIMq5H9lFV2rNTvNWPZJL/fVIiZAo6iK6IFIeVNlsjEprbNApPa36NNT2zsWDRerXlhg6i5kIYulJcj39gyjcEcaTaobOGRgaJ7/XYiPcclLkfQo0dDBZFfqAOYF+6HClLkKXEF3N6DpTFJQ+yM6L0YGgxQSGWZCZBrcGtWX/K0F37jZOr46GULYRR07KX0zmlJUpg1GgqjNdURZDqiPtzCJ1NYl/5esvRpJpa1+vnKSApIVvXn4QPa/TPtdXf8jO7v22dL7WazvFnOpnvGQLwyEmGUfb6ZRku/1/Z28xUjq0ggWnM9xGGZVkX8A4a0/SjsDL6l8674A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+GUzqXZnN9KgWDZbFfw0QSufZRF5F6NsWh/ypV0kGk=;
 b=U8mACLYR0MuSIpHM7ByCg4D64kSB4FPn5DSesUSESt3qhBRWUfSlqSvvhdqdXjpbzEVrzEFOG0Czj7nNG6OCCsRpiTkckMOlqEjz3NaGNeO3IepxyjCm4UjyH13iPHPmn3Sl9T3cQCfk5/ayRkqUAGJ/+F5U2d85V3WjrnVgEHb3N+GTKojktkv11WLEkvAhrWyvTijZbXrrb8rTpYKxvJYNUcW7Z245etiiRWCFCZLq1XJmSKcBKJY2kevZhdKvcqRDg55Mf4V32eYumW4tkYXEO+XCnTe9iue5GRlaqmBVAFLwk2oLLIKBZdSzwNogVzHRKfZ0Z66xOkVz9PFMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+GUzqXZnN9KgWDZbFfw0QSufZRF5F6NsWh/ypV0kGk=;
 b=ms0+tKugwFl7gWJOv7pDaaZERUZ4/FvV4M7DNC/uW83RLNIO0QMCR2RHfJFmKoPHDWUsBfbBZGHH1gqE9cAUt5b0ez5M+Ni38YUaof3tHNBSatYTTJh+4SMOu82P5tbiL78e8JOj4ApRdIB+eRTSLCbe7QAG0Z83QQsVxfytlX8SQCMsGZV986sactYbMVPZLiGmu4us6HPeOaS0i8CwY7YORW4oMw9mbu9NBdOu299+3ijsftEGBkkJ5ijPZXaQHqsGiGyO4LuWSSFOoeNonWBtsDQiVvk0GroUmabS9VmcgfANHXg1yY3tazjPXkJzbzf3mfxJOxgwykNGOA2s8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05808302-3e8b-4e87-89bc-950261300958@suse.com>
Date: Mon, 27 Nov 2023 16:55:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
 <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
 <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
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
In-Reply-To: <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: e6af69f1-1525-4600-9bbe-08dbef614d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FM+K8cmSOLmFfFrIx7hETehZCMDz6PUJoXJX61eHLnCM1htJYFVgf8bcW6lUIJY0xS5uO9UcWQLXeF3lo1o06V2MbXWEa7LKKAoclazrEUks13I5rMe7wWAIoxw2SwrIni1a3cmcXQ2JEJAVohmM6QXVsmyKUAMMK8yGXINCWK+AjVeo4qSWOxFAXsTJ9YgfQ0RyC+wmTqCsJgGuFa+PMIqbOyuHKmIn8ByltpqjctkDUta2jvPg5ZMwFUBuZWx14/kcN8n3bRr9QptUS8tet6w85uKS6GdivxHeFHu+whSBBuPYrITByFjHZ7cAc6vi2hEnOoxsMAkEqgKrLjU5xCa8O3ceZh5qwc6YEyhCfuJdrN5rh1pBCHdyhmfr3cn2Qq4iPjRBoUTxeX+HrBVD1N3evyUBk2fn5FGzkfHQEpllpfsxqTIEILabDFq5vUydVn8fhv6HqWFjily7gZMYvPKdzSRQwp6a2/4dyNonfXpbm7hDXB4NoSmA5/K0OdAEVMiYuP+OZ0EhwbooCpZDnN5MhWFs+pbzwS0roz2hVFe4EDoPJ4Xpc98M+F2GsptMX3MLvLW/KSMUXHAkku66GWDBxdf1BwGehYXjEMiHZqDqct7ZD9rJsFwC33D9Oyie64zHZiDjEgAbS97pVoOeqp0y4rqS8B0E3lVq23AVzsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(31686004)(4326008)(2906002)(8936002)(8676002)(6512007)(6506007)(53546011)(86362001)(2616005)(31696002)(316002)(66476007)(66556008)(66946007)(6916009)(54906003)(7416002)(5660300002)(478600001)(966005)(6486002)(36756003)(26005)(83380400001)(38100700002)(116466002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3BGZ09wK3RBVHZwanFlR1dRY0JQK0hNOURXS2FZN2dZVVc0Q2pxa0loZkls?=
 =?utf-8?B?Y0pGRG1ydVZORHluRE1Wak9Nc0s2VXoyY2ZnazlkY1c5aGQrSW5qeU1ya0ZK?=
 =?utf-8?B?TUxXQkFSV2M0cFpaa1I3eEQrK0NZcWlJamRFckMyUnVOZ05GdE4wUG0vZ0Fr?=
 =?utf-8?B?cTAwSjZTWlE2TzNDR21VTUZqMFA0U0s5b0VDcnRZbkRUSWRCNFY1NWNTVHhY?=
 =?utf-8?B?bEtBZWs2RnRqU3R0c0ZoSDk4NHRHVUZ5NXpVZXQ4Y1lidkp6aXVobVdCNnJ2?=
 =?utf-8?B?eHkxdTlIa0RiVUVhSzVXLzVvUklvZHpzaXpvUlUwYU0zV05rcTYwV045Zk9O?=
 =?utf-8?B?RGdHRk5lVUZUc21pM3pzaGhrWkIxa2dleEVzdm9TR05vZnd3WVBaTGVYUVNR?=
 =?utf-8?B?cStubjB5U3ZNVjJsZVF6OVRYVlNlRnZFRVpsbnpHdVVqQVY0VXI2d2dmSWh4?=
 =?utf-8?B?M1hMeHZCdURpTUVwSUZ6MDQ5aUhUR09iaHNpNXUvZ3pqUlhKTVJkMGpsMkQ1?=
 =?utf-8?B?YUVWdEpLdC9mWng4bFpqRjNzRDZaTkkxVXpmNzJObUkzSGhRVVh4UTlaV2lR?=
 =?utf-8?B?Y280ZXJ3V216QTljSHFnMUJEZkNpSVptZWJWaG92R21Od0d4T0ZpcC91ejRT?=
 =?utf-8?B?UERhbXRKaXZtNGczL0NYUUYweFVQQ0YxYmR1OWlMQk9vOWJCdXBsemw0c3Ri?=
 =?utf-8?B?dFJLODc0ajFNOTRJMTFqSldWUFBnZjk3RDUwRjJmdWxrSTZ0VFNGMEhka0dX?=
 =?utf-8?B?ZEY3V1MyOUM2dEU3b1kwZkp2L0srY3VVaXJFNklxTjlYYkw5aWF0MFJHa0I2?=
 =?utf-8?B?dVpWNkw5TGo3TkJ0a1lDK3djWis1YVZsd0d1dUsyUGhWZUNpbHp3amlJVUNq?=
 =?utf-8?B?b0p4dm1UV0NodXlINnA0ZHljRUY4ZWloS0VDeFRZTTRjeXdqb2VoYWlFZ2hW?=
 =?utf-8?B?S1puZ1RBejhyWHIwRXdzblNpa3Vqd1BrV3BlUk51MGpJclJIeDhpRVlxWGxo?=
 =?utf-8?B?YTlQNHBGc3dJYzhMV3NJM0pTdFhlM0lxM0lqbDJBMjhHejdRdFk4REZFeWZt?=
 =?utf-8?B?aUlPU3liS3FJNEZDaHBmeE9RUnNDcmRRdmJOb0M0aHc5dmpLZjZYSHVuR2xM?=
 =?utf-8?B?RDdiNVI4SzkzQVZMY3dXV0ZJYkNmcGtPMm42aDJ5aTFLZjMxWWJlbFVzdjVk?=
 =?utf-8?B?ZnNTSjJOSDlPOUQzZUM4VTZPOVQxVmNBeXluMFlWdGpaOG41Nk9RL0lUZS9q?=
 =?utf-8?B?TmpyY2phWHh1WTE3VE13MmI3bDNBRVZLTEErSW0vajFYU1VCYVI2RFA1aFNv?=
 =?utf-8?B?OUQ2NUpqRUxkaml5RyswQklNQVEyLytwU3ZOa1NVUjhwc0xhcE9mQjNlZ2ZY?=
 =?utf-8?B?YklJTDdHUmNONmk4VzRXbmJBZGp6MFF5cGRsNWF5T01nVkh6OU9UNFpmWm9j?=
 =?utf-8?B?WHNZbXJWY0lkTW9wb24zMVJZalJVRGpZc3h1ejRvaHMwWHo0OEtsalFoekNP?=
 =?utf-8?B?YWlQQ1M3Y3VuV0JBWktFOFhnQytBV282MmRwaWRsSWhGNXgzWWNRTjcrblJY?=
 =?utf-8?B?YkhHZVNaK2xRV0FHWkJMazNxSUJMTkxOaVFwSzMyQXNKVmZhQkVrMExHTEI2?=
 =?utf-8?B?cytMWDhhZktwY1c2QlRZKzk1RFVEdW1HbXkwU1lFM1E1SXU0LzZpOUc3Z1pG?=
 =?utf-8?B?NnBxemtWTmZFdldyWS9TS2hWTVhmVVpCNWdJclJudVE0SVhVYnA0WVpLWnhY?=
 =?utf-8?B?cXpmMGVzcXRpYmJ4cDdpYnVCVVY1enM5a2s4WjdpZzA3cVBtM1cwZkVEbUJM?=
 =?utf-8?B?dS81RjRHd0FLb2FXb0E1RkRUVEZjeDFXUGt0dktJNU00YkZmUzBUeUxURitt?=
 =?utf-8?B?eVVDN1FFTmRodmVLMWlmVE5CN0dwZnBYOXBYRUNTaW5TdTRsTE15Y2oxcmdX?=
 =?utf-8?B?aGxYRE0yRDNYVlVJbFpyQmt6bTZDOWJkRUhlQ2s4VUZhSWp3dzNxY1l2MUJr?=
 =?utf-8?B?U3B3TGpadjlmSWRHWXJQaWViUnBqQ0FJaFdKZFNzN3dWaTN2dURvbjhCMzQ1?=
 =?utf-8?B?SmNoS3RuNEt5ZnFVcUs0QjJxRWNxYWc4dmV1NmRZZjZNYlUwUFY3OGFGVGNU?=
 =?utf-8?Q?Yss2s1+2HZvwunopvtuofyQ9C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6af69f1-1525-4600-9bbe-08dbef614d86
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:55:39.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL26FAqTXZBUVKduMnnJUnyxrJQJqlkgqhOeegyZ9JbituWI/oyB3zb0vykTUsdYfZFJu1a3fcEV+jk/rk/fNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160

On 27.11.2023 16:37, Luca Fancellu wrote:
> 
> 
>> On 27 Nov 2023, at 15:13, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 27.11.2023 15:58, Luca Fancellu wrote:
>>>> On 27 Nov 2023, at 12:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.11.2023 15:52, Luca Fancellu wrote:
>>>>>> On 24 Nov 2023, at 12:47, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 23.11.2023 15:47, Luca Fancellu wrote:
>>>>>>> Let’s continue the discussion about clang-format configuration, this is part 2, previous discussions are:
>>>>>>>
>>>>>>> - https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00498.html
>>>>>>>
>>>>>>> You can find the serie introducing clang-format here:
>>>>>>> https://patchwork.kernel.org/project/xen-devel/cover/20231031132304.2573924-1-luca.fancellu@arm.com/
>>>>>>> and there is also a patch linked to my gitlab account where you can find the output for the hypervisor code.
>>>>>>>
>>>>>>> For a full list of configurables and to find the possible values for them, please refer to this page:
>>>>>>> https://clang.llvm.org/docs/ClangFormatStyleOptions.html
>>>>>>>
>>>>>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>>>>>
>>>>>>> Our coding style doesn’t mention anything about alignment, shall we add a new section?
>>>>>>> I can send patches when we reach agreement on each of these rules.
>>>>>>>
>>>>>>>
>>>>>>> QualifierAlignment: Custom
>>>>>>> QualifierOrder: ['static', 'inline', 'const', 'volatile', 'type']
>>>>>>>
>>>>>>> ---
>>>>>>> For “QualifierAlignment” I chose Custom in order to apply in “QualifierOrder” an order for the
>>>>>>> qualifiers that match the current codebase, we could specify also “Leave” in order to keep
>>>>>>> them as they are.
>>>>>>
>>>>>> Where do attributes go in this sequence?
>>>>>
>>>>> I think function declaration/definition and variables.
>>>>
>>>> How does this relate to my question? I asked about the sequence of elements
>>>> listed for QualifierOrder:, where attributes don't appear at all right now.
>>>
>>> Sorry, I misread your question, attributes are like invisible for the tool, they can be placed wherever between
>>> each of the QualifierOrder items.
>>
>> Hoho, one thing where various options are tolerated.
>>
>>>>>>> --------------------------------------------------------------------------------------------------------------------------------------------------
>>>>>>>
>>>>>>> AlignAfterOpenBracket: Align
>>>>>>>
>>>>>>> ---
>>>>>>> This one is to align function parameters that overflows the line length, I chose to align them
>>>>>>> to the open bracket to match the current codebase (hopefully)
>>>>>>>
>>>>>>> e.g.:
>>>>>>> someLongFunction(argument1,
>>>>>>>                              argument2);
>>>>>>
>>>>>> The above matches neither of the two generally permitted styles:
>>>>>>
>>>>>>  someLongFunction(argument1,
>>>>>>                   argument2);
>>>>>>
>>>>>>  someLongFunction(
>>>>>>      argument1,
>>>>>>      argument2);
>>>>>>
>>>>>> Then again from its name I would infer this isn't just about function
>>>>>> arguments?
>>>>>
>>>>> I think it applies to parameters and arguments of functions and macro, given the description in the docs.
>>>>>
>>>>> I see your two snippets above but I’ve always found at least on arm a predominance of
>>>>> the style above for functions, so arguments aligned after the opening bracket, for macros
>>>>> there is a mix.
>>>>
>>>> The latter "above" refers to which form exactly? The one you originally
>>>> spelled out, or the former of what my reply had?
>>>
>>> In my reply I was referring to the one I originally spelled out.
>>
>> But that's properly malformed, for not aligning argument2 with argument1.
>> Where are such constructs commonly used? I just took one example (cpuerrata.c)
>> and only found my first form of wrapping.
> 
> I had to go back to the thread to realise there was some style issue, the snippet I thought
> I sent already had argument2 aligned under argument1, like this:
> 
> e.g.:
> someLongFunction(argument1,
>                                 argument2);
> 
> Even my wording was not really accurate, as I meant:
> “This one is to align function parameters that overflows the line length, I chose to align them
> *after* the open bracket to match the current codebase (hopefully)”
> 
> So to summarize, this value formats the code to have overflowing args/param aligned after
> the open braket.

But the example above _again_ does not have the two arguments aligned.
I would have suspected a mail UI issue, but
https://lists.xen.org/archives/html/xen-devel/2023-11/msg02366.html
similarly shows way too many indenting blanks on the 2nd line.

Jan

