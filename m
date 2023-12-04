Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3D4802E3B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646639.1009095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA50m-0005xt-KA; Mon, 04 Dec 2023 09:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646639.1009095; Mon, 04 Dec 2023 09:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA50m-0005ur-G7; Mon, 04 Dec 2023 09:13:08 +0000
Received: by outflank-mailman (input) for mailman id 646639;
 Mon, 04 Dec 2023 09:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IRNf=HP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rA50l-0005ul-PW
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:13:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d4e829-9285-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:13:06 +0100 (CET)
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 09:13:02 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::a9) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 09:13:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 09:13:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 03:12:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 03:12:31 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 03:12:30 -0600
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
X-Inumbo-ID: 54d4e829-9285-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOHaUdh07Ak2LgpSH6y+954Y9QwGNVXpKZvx7mjxB8TjknqYmsax5FTGcP/NgScaUaV+zAijcjB+1omWoV7Yg/3A7SK39kvCmetxVuGSW7snj299kw6oqjhaxQglDRdpHeN/i18pRlAgGyNlmI7v4MOvGWn8bnDGLi4E1OO1cWRmnmSpHI/EdGk8iqOyGnrNRZjQIChfy2yGYooQO8rRZo1TPbnpCks38MRQVyY6dw69QJ/ebyReycObw6FIECgWi8CuSZLtAvquDKbLHP/+Q4D0MHtCYXA/vD/dK0dTvsm9M353CwCr8yeQzFi8K82sg0/I7bR24CpmUwu5beLxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxbgpCgy8ggdSBLguLWW8+stBPfnm0i2Fiu4yP5/TYs=;
 b=QRGhoo3qY2Lh73C+X9rTnUUhwu09jwkYOu3HJFuc4XE+9Q/qBx3DwTFfrdds0j876NyGhcAniero1L/0DYLpaPg4esgexmAX+d3+K73iBchIUkX8tkNtWjoGoVPPjjne+OtjATxqkENBenNxj68tlQcTYcoOK6N9+4aoBdThrJpKyXu+TrkqSUgHK/ukb/a8PjcUv4UcQcHI26PyNyB3Zzpc2nagXOwRx8BrQBKQswz8+5mJytCJSGp85C5zrptxtUOKNHNECotjZhFoBjNfUzJaFIhvk6ZIaBWR/1SQYQ0valm+fLWR7bCHX24JAoznMxcK3xEjXC8riZvRIkQ/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxbgpCgy8ggdSBLguLWW8+stBPfnm0i2Fiu4yP5/TYs=;
 b=dRD1QSysVoQEltMOC9hcN6Q84P3lMeQ60bsh0b+/avTKZZScVJaQs6oCzIyNZxYwjuzhZnLtBb544gxEuUtvNFySCkTyhppNAtNmigoVicmZzTeAKb/ncmtIM6LDUqBJSo/WW6wdLEPMhmFKQN0A3gDLXJP9luz11c5aSWVWB+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <55353425-2ea9-4b3b-a415-b6c515006c61@amd.com>
Date: Mon, 4 Dec 2023 10:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 525c7c09
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
References: <656b9ad4c0656_2c9b1b813232d@gitlab-sidekiq-catchall-v2-744664b889-4scj5.mail>
 <fcb2675a-6570-41f7-b386-93fdb4b513fe@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <fcb2675a-6570-41f7-b386-93fdb4b513fe@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f6fd88-e6c1-4520-14d4-08dbf4a9372b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mkern6ZkFxkSrzS4gp+FcPZmvEmrrvFcmuENH7bPEskB6hPwMhnsZN9V+J3LEo+d3RhgR6svv36ciwfXxAu53Cmv9GLR9F/LWpVxNnLxyw1fO6svYY4UhRzP8MVRv6Pbga1EaI893ForKuJ/gxAp2b2ECvIw+KZowoCPd1LvRB1aC3tuBbja8rVW1feuLQ+rWPhPQUNoAnYkn3Ux9dS1PSYyv+GfhPckfZjity1RUZkRA2DAi7AybjavF7T6g73hlPZquDHzBkUMZRWzGxwpmdEYEeeDAdnUU3uYen3xO40DOc+kAqcKznw5yivXC1VNX4vhkpkrKGTbGH9RW1Qmt4S0oyR2Ze3TdoOfqrVpyy/Ji971h7CKzsGr/lZiCWQisWWR3KlseahVAn17JndUMwYKVioAzPe34hXtGIkpixQS5jzWl0HkmjGtMvByTkJDDB2Nqgl+gZudpsYlziSGhcKPMO0GG9VEPaHIb1WMKokZZm/uaQyLOS5w1Ug1+dx7Oz/2WlGBFX92zUuFmECt4MK+3fC/Xs8DQproCJuPIYH3uqpA02vXyBsKD7QJD1FFvNcVhmsx6J6nPqpDKfx7WWxCGOngOdvA1Nps11Ei5EHiESGF9N6DQL7NWbM/6XRcgaXWyfBYbvK0PTySrGp5kauYb7ZmZwvQlFUsKT2rFypIW3PsCWjYIUbk9rQwdmKqVuZPH1W66TaEtCYJ18lPCZd5dV8WpY/1GaZdyhUlYQF1veJnTWmVJZ+MqeQ+YzelyS+bPTEUB82+rA7aIxjPmfdyypLXZfU/39zoxk/70svu7h/Y+Qdb6AeQ/iXVOjPTw88k2nWnuR1/NJMXox8cNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(110136005)(70586007)(70206006)(316002)(16576012)(478600001)(40460700003)(966005)(5660300002)(41300700001)(36756003)(2906002)(31696002)(44832011)(86362001)(8676002)(8936002)(31686004)(2616005)(36860700001)(83380400001)(40480700001)(47076005)(356005)(81166007)(26005)(336012)(82740400003)(426003)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:13:01.4652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f6fd88-e6c1-4520-14d4-08dbf4a9372b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488



On 04/12/2023 09:56, Jan Beulich wrote:
> 
> 
> On 02.12.2023 22:00, GitLab wrote:
>>
>>
>> Pipeline #1092667236 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
>>
>> Commit: 525c7c09 ( https://gitlab.com/xen-project/xen/-/commit/525c7c094b258e8a46b494488eef96f5670eb352 )
>> Commit Message: xen/arm: Move static event channel feature to a...
>> Commit Author: Michal Orzel ( https://gitlab.com/orzelmichal )
>> Committed by: Julien Grall
>>
>>
>> Pipeline #1092667236 ( https://gitlab.com/xen-project/xen/-/pipelines/1092667236 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 3 failed jobs.
>>
>> Job #5664669062 ( https://gitlab.com/xen-project/xen/-/jobs/5664669062/raw )
>>
>> Stage: test
>> Name: zen3p-smoke-x86-64-gcc-debug
>> Job #5664669074 ( https://gitlab.com/xen-project/xen/-/jobs/5664669074/raw )
>>
>> Stage: test
>> Name: zen3p-smoke-x86-64-dom0pvh-gcc-debug
>> Job #5664669076 ( https://gitlab.com/xen-project/xen/-/jobs/5664669076/raw )
>>
>> Stage: test
>> Name: zen3p-pci-hvm-x86-64-gcc-debug
> 
> None of the referenced "raw" files look to have any contents at all. What does
> this mean?
It means that jobs got stuck and we should ping Marek.

~Michal

