Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659975462A4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346276.572041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzb7V-0002LJ-Jl; Fri, 10 Jun 2022 09:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346276.572041; Fri, 10 Jun 2022 09:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzb7V-0002JG-Ff; Fri, 10 Jun 2022 09:39:57 +0000
Received: by outflank-mailman (input) for mailman id 346276;
 Fri, 10 Jun 2022 09:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzb7T-0002JA-Fs
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:39:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48014e42-e8a1-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:39:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Fri, 10 Jun
 2022 09:39:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 09:39:51 +0000
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
X-Inumbo-ID: 48014e42-e8a1-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vkh4tr1/plfJqy3LdliUnxO2tTqttDlxwcCVi4YxlLKptDAULlumZKuTUvirU+93c9FsK6abvrtn1flloYm5KTtzGieErYxILNfcP8CiNcrXLzOf0NTd3imEKY74MB3xlZLjFMNUvCQ/fIFG5Be2SH8Nd2cpwUBgyg99oZUw4XAIf/t/d4Cf4tW+gaaw55Onuqurl1uV5ZIfcs+P0yBCSeL7tV0i/gs4SxGtvv+G9P+TNQYTQWmpOxz9dITFgHdseip7LOm34/TStn4aNnPmDgA1WggbW2io/8trZz0v3RLUKuDiKtrcPv+d3n1A9sgr53MmHIomlV8i/okIjDCueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irl7u4k7TRAFph339AjNMwuRM+W3vbYjB+GXmhTMj/Y=;
 b=BPAC29OZQ11WKAtPjgGYW517AUNUK12iZxA3sUt7L9f46DZjtmG/DqQtvRq6Pj3vtdUVdbkiSZLXB9y7/H7ma41jHY//ts7G/dJIc/FygKyPALuW8e1ih14rEVsJuEHAhxB65fm5R9O/WN8tjgi8QFY8XX4vDjDuHigCbEfMjHi9xVOhj3UN5zpegddloiiBWgSc4mMT2Ho1Mm1gZKRjV3MLgftWMPirIMdYSjA7Wd9UaKqJaa9YIOS6rRZbvDT6kBOy+ND/8IsBKkuGvRz4afhQofCDWAYR8Q+WdKps7+Xnfy3zLAXDJVINcI6iDhGkpKSeNMIK0SVRyW0yCd2tRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irl7u4k7TRAFph339AjNMwuRM+W3vbYjB+GXmhTMj/Y=;
 b=mGPIqhv1zF5COMXoE3Kl8Oq4421rNil9l1S6iR+Ddu0+xs2m+Tl3+IxhF2kjA6L3IUQPkqJ0xEGvbnJuhryNVZB81OYK676tphDG+Y/BS+i0X3A4u3eG/k6b+3cX+7l3y4xxEqIod1mMCTXJV9gMOFZ6pt6c8cUAlUvQJtigCstUoKhQb6naTzqg1xE5zhRmF+45ASD0ZTtOt1bb2KzCFEtGPBKvajcvfokaLCofPtd5pBg/OZ7dIgcOe/uJ2bKjBnT/4tDNCxJaJF9H9GIO6LBn+L4ITlUfZspVx7JnJBgQOweDMUbuvMPMsOmNpybGBFK7itZx684ynnbgNPSxPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e021461f-c21e-667f-d3a0-970b028be42c@suse.com>
Date: Fri, 10 Jun 2022 11:39:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Question] Alternative Method for git send-email
Content-Language: en-US
To: boyoun.park@samsung.com
References: <CGME20220610093115epcms2p3017e473201e08cec7f3d8108d17199de@epcms2p3>
 <20220610093115epcms2p3017e473201e08cec7f3d8108d17199de@epcms2p3>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220610093115epcms2p3017e473201e08cec7f3d8108d17199de@epcms2p3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0273.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e27656c-08da-4b0f-4cdf-08da4ac52abf
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4166334D4AC1B7FDC6FFD182B3A69@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wNB3gehvaV1fXj7LbPc5mRLgMBSQFeGlj7hI+XnNfjoWh/G5MhzScr/lnzTpEkerL9rOvlhjWqDmwq71sUj6wjzyuQ91eIV+WCgc0ov1EBmeRCweERcLiIveruyWTw3BsTyDbeQK0GkrhQj+zvdjMsI5N8iEty1v1M056ZtWB6XMl0Lf/5078NLuovIMerT8aqaVhYXGOAstGzOuuW2/WRZHn4m7VXunEqBBOLReOM3NjJVF1hdhKgkBjzxT48eQGLe7qNcf0eO5vwInOx36ABKfUy0iSu0nFEtYhRJczvSXioXrmxxaxesD4GJDzm1kp61J2CIYzDMMxRmyRSak54HOtJHq81veA1Kn1tSxaplU2vaEYF8M/hr7Gh90JkJ1Kp/++a/6ZKa1oAc6AY7EHefyA868YJtLOxo2R6hxdSrVHUxwplrGmqp+EI/f/FP9V8ZsvRUrefbUz8TTlol2VN6iSdUnMKtCm+MPVGqC7QKzhkPlETYuPS3M91/gT1P4DMqeUSL+/5Wxfm+vjSPKdNhBGgpOETwr08/TU4xmERXAQneQlGvBvCBzV7UuA9ZWihhCUnn8NdxjHgyKOEUIClCEI8rWDxXHDQbbNw7ufCGijEbiJi5UDkjFH8RIjCUAlfRaHqQ/jIcFMgVqdxMJFM7Sl1jG+IrRc7kLLOkMappQudTmEJfNN8iKf+t0EAtFlOk/lAWOa/H8rQuYnpC4Qf2j1DahgiN4oIik1SVotGdKHoKth28CDWry7MwXJVw6AN4AnY+EYMb3Q6oo8DF6zU0uFeSCRTgFQKsvJ/iEmr4yt8Wg+AURol2OB1lXMLMc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6506007)(6512007)(26005)(2906002)(6486002)(966005)(4744005)(31696002)(86362001)(8936002)(53546011)(38100700002)(5660300002)(36756003)(508600001)(66476007)(66556008)(186003)(2616005)(8676002)(66946007)(31686004)(6916009)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU11SUhRUC90a012NHJMbnd4cVVHVE1VdEdSTll2QmNUMUlvVFFBb3FWeHFC?=
 =?utf-8?B?cDVFYVo5a1FBU2Y2TDB5RlRNWVYzU2hqclVyNlViQ3JCekFRblJSdUxUVHAz?=
 =?utf-8?B?U0hsdGlIN0ZxbzIrQnQxSHBBejhsVEk0NFB6L3dNNkRpQlI3ZFMwMGJKT1RC?=
 =?utf-8?B?NHZBZ3Q3MU1vemdLV2VwRkJEZnhDYVFSRm5KNG5QVldmOU45eTR1SlkyWXZZ?=
 =?utf-8?B?SEk4MkpvMGtBd0V4Qk9XN1VYbENaK3UzSHRqejFNd2hRcUt3cDVLdUIrQXlH?=
 =?utf-8?B?YXAwL0JqRm5sR1poRHJ4WjIyOTZuQW1DRFBmSFZSZTF3WnpWS3NxSng0cGVC?=
 =?utf-8?B?WkhoQlUyZklFcmJIeHpGc2FGNU5LaFM0T245d2xJaEhZVUtvNlhydnBXR2k1?=
 =?utf-8?B?L1g4S3VKTldlZE11cFI0N2pRZm9IV3pNUTdEeEw4RkNHbDUxbDdPdFZEQkM5?=
 =?utf-8?B?NGJvRHI4SFFHVnZnUGx5bTBrTlhKdjVyQmNtdWU2V3ZyN1Y1QlZmOHZ1VFdZ?=
 =?utf-8?B?RlJWY2NVcnQvY2swRFNHalNudFNnbklmT3k1YiszSGl0QUR1dHBLZExFa1or?=
 =?utf-8?B?WnlLQ1EvUzFsc0NpWTVvcnhwelM3RGVrQWxVSDB4MEphcnkvSGRTTFF2MStK?=
 =?utf-8?B?bzA2Q01wQWFLbDVpdUJIVWtzRUFWM1BrU3pnMDFrcVEycmVjVXZPSkFmdkgy?=
 =?utf-8?B?NllxQzdRdEdpNFAxOE5KU1RhSjNNWVMwRGwrcnlLL2hTZklGc3ZmRElrOUVU?=
 =?utf-8?B?SXljdTlGdjU0RUlUMHBTUjBjZlZjUFkyMFRUYVV0SEI4RklGbk52RFplWXp0?=
 =?utf-8?B?R0FMbWNPcm0wY09nZDJkdFRUTVFLNWpVUHB2OWl5QlZCdnVRUm1tOE9IKzY3?=
 =?utf-8?B?MXhjY2xuTVdjOUEzRlA5aEx1V0dNTXpjU2dsaUp1dzJEZVpQamFGd1RMUzgx?=
 =?utf-8?B?Zy9HQldBRkd3LzBoaEk2c2FFaDlyd3BCVHI3eTRsbjF3cEJGUnZvL0o1NjAr?=
 =?utf-8?B?ckZUREUzQWI4bjBhb0R6M1BRdjNzOVZHOEFraStmUzZhTi9zWVRIK1dZZnps?=
 =?utf-8?B?VnpXbHpYUDIrNW0zSCt1bk5wbThKdnJXZzZkNWU2dmFaMisyQ3BlNk1XU0dq?=
 =?utf-8?B?RTNZc1BMTkxUYk44aG1qZTAwS0NjbithV3dCVUM1QkNURC9KWG4vNkZCOTVZ?=
 =?utf-8?B?S2VaVmJoOXcrdG5TS1hlZkJZMFhBZkhVT0VRQUwwZnpXWGdEeG41RWpOdngr?=
 =?utf-8?B?MWlHRDBSRnFSNE9wc2Y5K3B1MDFubmNFY3VTN29ML1A5R2xLZmdic3lHTUtr?=
 =?utf-8?B?YUhyaytsbjluNEw5cGh4QWVWaDJtUDh2c05OK1dGb3N2TzBWNXFFWVpBYlJz?=
 =?utf-8?B?VzFCKy9INmJyY2NTM2R6cUxpcFZiNGUrWWV4a3VXd2tyQVJ2NHlsZjBlNWM3?=
 =?utf-8?B?YTZIdnpGOHpPKy9ibXlqRW1jWE1xYnJ0N3o2M2w1bUZ3OERUamF4TWVxZFh3?=
 =?utf-8?B?NVVmbFZzVmNuNWdJYmErcXNXMmJqSWZTbzRsM1VIOUZITUVDYWJ4TTU4aU4r?=
 =?utf-8?B?SW9zaCt5bERZbHI4Vnk1ZmFDaWpJTUU2UjRsbU40eVg0Y2lXeDRTbkhUMUEz?=
 =?utf-8?B?T29jNGJpSnB6YlBnTlIvMWRoZk1oZTcyM0Joako1Zjd4SWJkSWc0elJCV2Jh?=
 =?utf-8?B?VjZGVUdaOVpyWTBraEVFM2VwRk1WREJnZng0NTBnc2JncUkvQkxzbVArd2tZ?=
 =?utf-8?B?WU50RElGVEwxcE5pb0UrbVF6SFhMakNjNVlnc0pkbWpLd2E1akN3ZklrYmJE?=
 =?utf-8?B?d2E5ZEluZ05lai9MZDhBb1dUTDdseXB1UjFqSzRwSk96WWsxK0hTelZic2FZ?=
 =?utf-8?B?RkFWVE9lQ0dJTm5QZStmWm1vK3d0UElaRUhvMHVuY1JqRXFhb0V6eDNPQlZJ?=
 =?utf-8?B?RFZiRlE1a2pIRHdkeEQ3dUovOTRjSWRmdXBsQ3d3SHlhSXlRV0o5eU5NRkNS?=
 =?utf-8?B?SmFkb3FjajNrWm5raHUwdjBIUldBZlJvOUNNUWR6T3cvZ2l0RDgvOUVYd1g5?=
 =?utf-8?B?YTBUOXJwZ0FtYUtvbm5Ebk1kVWE0dHh3bjdmQ005ZDN3RFZRZytHaVdkVDM1?=
 =?utf-8?B?bXovclA0MzdaVGExT3ZKVFRneFRhaXRwL3VvWFJLbzZ0R3V5Wm83MlArcWd5?=
 =?utf-8?B?dlNVN0RhZGM5eVhIZXpsb1V4VkNnc3FHNEg3Q3djUHhJMjJsN1dpRU94N1Zt?=
 =?utf-8?B?aTdUeUJXNzhXczBSQ2Q3ZHRmdE5mb1VPUHA4L1Mxb1VUUHEwTURKdnNuOFA0?=
 =?utf-8?B?TGYvaUl6eEYwVWt1STNSRW9JS25yc1oyRlVvOWVibFRYcGlOTHhHUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e27656c-08da-4b0f-4cdf-08da4ac52abf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:39:51.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNXzyNk8BouNmzIaBcpgVRmhWEKfbLLs0v18os3L5mjGTLeqGLjgO06KuTxJGTJihtiS02Bdv7FlTMQYlqyuLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166

On 10.06.2022 11:31, 박보윤 wrote:
> Hi, I want to contribute to Xen Project.
> 
> So I tried to follow the contribution guidelines from Xen Wiki.
> 
> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches 
> <https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches>
> 
> But I found that I cannot use smtp server directly from linux due to security 
> policy from work.
> 
> Therefore, I cannot send patches through git send-email.
> 
> Can I ask whether there is any alternative method for git send-email?

With a properly configured client (and the server side not fiddling with
mail content in undue ways) you can simply send patches manually. I do
so all the time. If you absolutely can't configure things such that
patches wouldn't be corrupted, you might need to resort to attaching
patches to your mails (but for the sake of people wanting to comment,
please nevertheless also inline the patch in such a case, pointing out
clearly that a well-formed patch is attached).

Jan

