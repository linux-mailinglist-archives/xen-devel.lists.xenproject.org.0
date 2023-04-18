Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD06E5970
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 08:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522569.812040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poeqy-00024k-7S; Tue, 18 Apr 2023 06:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522569.812040; Tue, 18 Apr 2023 06:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poeqy-00022r-3u; Tue, 18 Apr 2023 06:30:12 +0000
Received: by outflank-mailman (input) for mailman id 522569;
 Tue, 18 Apr 2023 06:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poeqw-00022i-Qz
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 06:30:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 761f6983-ddb2-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 08:30:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8554.eurprd04.prod.outlook.com (2603:10a6:20b:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 06:30:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 06:30:06 +0000
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
X-Inumbo-ID: 761f6983-ddb2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhvnT2QUtlvsE04bc9+M22DuU12EsP2PtaQ2SNahWViYU4O1RnmqlxKsasfQ9nbmazWIU57Ssapq+wL5Q2mlcGiykpMfLTJA1+Nniq+SKtW/++bUAGWcuQqybbVPSXo29zQa25JgkdzoybbL0mFEw6webKarxHVFnlhPE0zKQWtmj02IKgfwYVlSh0zS7IU+5Mqag7k08tkimJ4Yr2bqHiRJSS0RyqoYLEppBEoPhtQf4obClU+NkiX0+5cKOUqxmjpsPTgFoMlxwqwR3JLYXXKUFa/8Pq1pQjOHCxw8uh2alPzyOcB8O5/Mj32gcSFFSxz4zk1yCAvzmPKyNav4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BayzNk9IyBQWsxoVQ5pSfpENWVpDuOMxuMOF13tzeiU=;
 b=loIIfRaU+QkROXS6XJKFrn9n27aoQffbgsNQSuYP05wxyreCfLHkuR2rd+TCbyrQbEidAymoDd4uUweicmkelx7B4v7Zo3H4+wORcONGL8mvMOc1SKhrxPbwSJ5AeYeD3LM7INed9Hlo20frX1nnEZcvFGtaqCP8G55QrzLoK2E85UOeveUcX6N6y8ln8QSOVHWpOtcMOoIibQlI8LNnYjeQYOQPUYdNe33HPnmQZ94aUpiXUcdNPwpmKdkrWhpddEvWbsGfxSVAvxH/FcA3DlgLgB5dw7XxEUC7lFiVLtqhfkJEsqc0fIY0NslHNnZhFYxFk0s4D1VFDJPkJSzQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BayzNk9IyBQWsxoVQ5pSfpENWVpDuOMxuMOF13tzeiU=;
 b=VX1+IW7HJdyM7ugNAboZly/b9LcYAQnkAAACpZxTa7v2m5aI/7auAR4vsF4+6zB/5FxhzJS/3U/oxRqACKlQOJ12HnOcleKNg6WC2l6O4FsTHNz9tRE9flcU52LhWDYauIZhsWnCB0lyzTipTDptd0pVUzK33s4EZfangJ857uNS4ciiLcm+8Be5kblh2OSbP194kuKozoQuc0D52DgBwqz7DhMO3N6e/DF2UHn/3bIH8cZi7Nvzu9OXgGitnBtVrEtyJFTd1HfbwaXmh5p8p6WU+uWf0SACEe2zUEe3QXcD8HvuF8Jmp3ESQVgLanqaKFI8C7eJYiSMQVdxh8qcEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdc599f9-da0f-815c-1850-3120c5f69b73@suse.com>
Date: Tue, 18 Apr 2023 08:30:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 0/2] deal with GOT stuff for RISC-V
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
 <69e031eb-6172-1ab0-5ffa-4650f69e83a7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69e031eb-6172-1ab0-5ffa-4650f69e83a7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6db745-76fa-4814-76de-08db3fd659b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OtB/64II/hLYSnLzM1YgtEirNFtyRX/vW1U6oyP82QL4BUevESyPJr0mG+SsKCKY8wKAKLNmj9ge8F5XVdcC3SS1x3vlV03pmOhW4ZqbG7vGcWxsIPIhcluf7bbkoGYZuLa3xTjnNAXSVAG1R1yl7ANfy21F87G7gMHgtLRgKpq/auRtvUs/BRPAUR0pCznJpLQVDB1eHLjEZmi7E+zIC9cPnlsmZ9Eqj7ivu1gcLCk54+7TE4l23/GnogtNweX8796AUx+JhD2r0GV4fOoViOEEuuh3HAGbzr8CDXvyPPfAr/K7VUu2zxUlBJzASanx9ia0bEIiE+zO0dY/JjMP/OGO/edMINk0hSJ5EmUuSs1yF3tuFcheUBS+esdK7YPgJGHUpxHiS5TjEGBWZx1EcNhOtaEa/IPfJxiTyUR4t4HEENiu/9W2zSvEPHXGntSKR9s2gbwSunCkP0G2EMy6pPUmBz/idA73XHuTOngREkr+kt18sHV/Itw58BDuURsk8q2Efl6sJ2lZuKV7YnwmdKUSThlhSODZ0UecqUz7iVZpCPzquRw/J28VM9uVAt/CdUFKF2o4Shu5t/vugAjPWo0K9G+maMmNjsbvw3/4hJpH0jzzSpaVh9Se3966mtW8pwYRJtCla7ENVvjd+Gnopw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(36756003)(86362001)(31696002)(2906002)(31686004)(6486002)(53546011)(186003)(2616005)(26005)(6506007)(6512007)(4744005)(66556008)(66476007)(478600001)(4326008)(6916009)(66946007)(41300700001)(8936002)(38100700002)(54906003)(316002)(5660300002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUtnSEVHc1ZzTitzVjNQR3F5M0MzWHRFNllEVUZTL0NpSTlLZlVsYWkxYkUw?=
 =?utf-8?B?dEoybkh3YzVEZ2dtUC8yVVlJS1pmQk1BWE1kcDlzMllzMldTZm1LM2kvN3VZ?=
 =?utf-8?B?cmtaTy9CM28zQzllVE5BOVgvNmtCUDJFeXRwMWxDeDh1M3ptbGNRVGdpNlNF?=
 =?utf-8?B?cHlkNTkyRXpSY3Z3NEd2SWNRNWE4dEhnMy9JOUtRKzJweGxrTDJBNThlR3NX?=
 =?utf-8?B?V1E2SWs5a0dKSzU0bFZQWEpWd3d1dVFpYTBEcnRPTWNBQnJXVFN3N1VlaG5Z?=
 =?utf-8?B?L29Xai9tWDIxSGw2K0NEaXVTSmZuNWZveUd1WTl4VCtiNnZXSmpCNGpyMzJ4?=
 =?utf-8?B?a2wrRVZONi9HQXorT2kxQk0vWVVqQmVWZWhpY3dxNVl3cEllNmxTejVWeG1R?=
 =?utf-8?B?UHlneWJsMWFxRFhtWUFEanhMQkRJMmFpeXl6dGRna2k4WUE3V1pWM3BMUkpx?=
 =?utf-8?B?ZzBUdE1laTdoejV4TTk5eENtdHhtdWdjNkpGM0k4aWVDQ08xYk1Xd2dtMUwz?=
 =?utf-8?B?OEdkMlNwUyt5aWtUODMySnBQTVpneU5EdE95ZDd6VXBKbkxuNXhiN0cxZG9x?=
 =?utf-8?B?WkVkdW5qQzlXcWM2aUpwODZFcml3OS9NeHcvTlVNZzVSRnU4b1NZV3FRNGFj?=
 =?utf-8?B?M2FKMmNKdEtHQ2NWdjI2Q3FhakZvNUlGL0FwRzl0ZEhxYnN3RVdNL2Vtekpv?=
 =?utf-8?B?RUIrbHN0b3ljNGhydEFDZnQvcjYyU0p6VXZnamdUZ3NaWnFrbWc5SDZQSk4y?=
 =?utf-8?B?UXBweWVSZTlOWWxDUlZrVTVCK1VUeFFRL3ZHY1dCaVI3UTVZT2lUSzltb2V4?=
 =?utf-8?B?UFhaeXNLd01Vck0zeGJOcW1TcUc0SnEwME1jWlZ1a3dXckk3ZFBOWVRaK29j?=
 =?utf-8?B?N09EeE93cVc4ME5Meld6enBNOUJLbVZPWlJtQTFGZ0pSTDVSaC85KzIvUFpa?=
 =?utf-8?B?SlpmKzlvaUlNRWMzeTYzOVNDOUlOQUdFbk1LbjBMWmU4c0lrS3pIQlBBRkdY?=
 =?utf-8?B?alp3RE9ScittVzNJb3cva0Fmd09RRVhORXc0WEcraGVPYnc2R1VlSDZPeFYy?=
 =?utf-8?B?c0xOVmoxZHNuQmExYWVRbDJGL0NHV1hEMFFxZ1NuUHhyM1hIM1QrY281bExp?=
 =?utf-8?B?SFN2dkpTa2VWYkkvZnJZcTZENlJSUTFSY3FRMDNaaGtwd1BFT09lanZyaHZM?=
 =?utf-8?B?c2FxWWZ5TUJTSWJWczRuNld4TkN6SmpaMy9TOUZ5ejlmSnZOanA5dUk3SlNC?=
 =?utf-8?B?TlZUbW1xYStna1d6bVNaeUFFR2duN0Y5eHRObXIwdzUyMkc0eFhmNFNmMUlD?=
 =?utf-8?B?andnZnptS1NVYThjUlEwTmNIN3JEVTBEOU8rMy9qWDhtbmhZRVdVdzFrNUFm?=
 =?utf-8?B?d1pINmVuQnYzQldlcFN2YjJJSzRGUis1WXRFQmJ0STh3TWRqZG94czdIbFJv?=
 =?utf-8?B?amRUZVVlbzU3Y3ZRQXc4Vndack1WOVNGNWMvbTZMT2IwQUN5c095U2R0elFa?=
 =?utf-8?B?cjRtUVBtQ0NlSGdIbXdpYVowMmtKRVQxL3hNUEF1cXNneVRIaDZJK1Z6OTk5?=
 =?utf-8?B?eXBtSzBzOXZ3eEtReURuZlNNb0YwN3FuczdPUXR5cG9LVzZHYnBKWjRnYkxG?=
 =?utf-8?B?ZGxqS0JWd0V1ZzJqcS8wbnhPYlMvZWVEbENyZVNLbFdRR0dTMlYxTG9uVXp0?=
 =?utf-8?B?dEh2Q011Z3NSU1p4RWR5eDUwREZid3BqQndGL0l5MllabkhvdklqSmdPbkRG?=
 =?utf-8?B?N21BT3BhRWFlc0JuNHdaQWhQTEM1dUo3T1U4Z1hoelJVMlJTWDYxOU9TcldY?=
 =?utf-8?B?U3N3Q1lEUy81ZGt4Ti9HMUJCWnB5VEtrSkZFWkZWaDZ5SXJ5TEhqNFhaQXFX?=
 =?utf-8?B?TGc4emxWTXpGbWJQT0g1MHFOMnY2ZDNVMmU0SUdycEVmM2lKaFZIaDhYYnNX?=
 =?utf-8?B?UjBBSFhBaUJuSlJGeHJWeDY0WW1tS0hPVm9jQ2QvSkJJaUhzZnA0ME5LSFFa?=
 =?utf-8?B?Vy9PQnFMaXNWNEF4WU1VK3JNaC91K0FjRnpiMi93eEgzU01MVjRXeS95am9z?=
 =?utf-8?B?Z2dDbnhsTEJoaW40UUlMdW9tdnNxQmZkem1xcXhTOVZFZ2dDWmp3c1BZcUdx?=
 =?utf-8?Q?NrscsKCOyfOQG3hoGxnvTG+NJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6db745-76fa-4814-76de-08db3fd659b3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 06:30:06.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkPeFQ0Z08ZGJO6d68C8U9vkSx7K63OJiYLRVCMVWD9O/UmR0QHTW92qlNoIxqwKuBnqFqPqAIv+nSHcSj3BaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8554

On 16.03.2023 14:59, Andrew Cooper wrote:
> On 16/03/2023 1:22 pm, Oleksii Kurochko wrote:
>> Oleksii Kurochko (2):
>>   xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
>>   xen/riscv: add explicit check that .got{.plt} is empty
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm sorry, I failed to apply this ack while committing.

Jan

