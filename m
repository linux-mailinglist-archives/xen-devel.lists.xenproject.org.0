Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F1646C8E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 11:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457000.714828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3DxO-0003Xl-24; Thu, 08 Dec 2022 10:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457000.714828; Thu, 08 Dec 2022 10:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3DxN-0003W0-TY; Thu, 08 Dec 2022 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 457000;
 Thu, 08 Dec 2022 10:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3DxL-0003UU-Ur
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 10:16:44 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 692f00ba-76e1-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 11:16:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 10:16:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 10:16:40 +0000
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
X-Inumbo-ID: 692f00ba-76e1-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igBJC4BqSYUQ1uF+cXqyDkCcx1QhSD6m8f7ye7NQXyFY53Q2yOUOWGT0HOnZ7R4hc0D8iqmKvw0auusjZysORKZBo93jIqsYYxFa0PnrMTyxsyJkcDgLR9j8cpeWUbOEWNuGa6ppDHjcTW41ANKJx5rgRyGtQz7/96QYeaIT26mhk3p1TvleuboTuHXWjmALd17gcjpOKIBj9ckON8Tu+3EMeGbbuTk40lyiQyPwdvRfh77AD8xcwk7B/b9zethOJQt2VhFOQ1JetRZfCLJnYUa5UfGWNW5Vbi/JwOOnUcXacEamaxtrNJ51s9ladI+VgLjDTFe1WPyvIdCgfFkiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzz9lgGD0AApeGNJj5117oc4rF1/6frUAJwbcmRxewE=;
 b=DmLXu45TtX2bghOewzbfHKiCR/lSzE4abbbuXi1tz57sA0L8dB9W4CqZQCuUCf5YGe5VD5W9yYq49NAbAfZ1ZvZTPWOQnsyo4DrAHmXtLVQMEvzuZdSAf2nV4HxwQoAtxPyjCKTPB06iU7zrLA5afMhkL16zAlfJ7VoUCHKLaHCD6UqlDp5+LNXzp+0f9n1umfuaCxdnV1oXCyrgkHR4HZ+yi1j7F6OntEg119dQxJC4ev9erIIz6Lpn4o0ADy6aSXiIoqxGzs6X0cGvAPWrBJTJwToRl7WbFJ3RyWYeiKF0/+xgKNkKkB7LEGZ4QBIJ32ZqwcOSKb6qrc8r84NBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzz9lgGD0AApeGNJj5117oc4rF1/6frUAJwbcmRxewE=;
 b=lVLPf83uvWHT53CQOIaOtbWZ3gJEmNJbNRj40fR+TNk2oLRIsyvI1SwoBCoYAsp5E7H/XPMw3dkSGZm5dfJ6JLy5fUCp1Smy53gHBkBO4E4VMFSMl0qnGpjfsUT7LcvrMv24yZmYvYPEnnZxpQIjBMyr2TeG303OCiWi+yshdG2Q70blBnNp6tupzDT22RZOE2qH0J2SpRIwJOOqBMQVzQB4PuGupywb3Urfzvm4q/vB/HEiA5OHZ2AgeUiCK14guKiqwROM1bOGPGH9BlAVMKO6rj1WOQnpIk1FW/T8GplLdyA1XqBTSb/5T4wBeM+FN3x79ySxjV3mOXCMgv2f8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50e10a2c-ab26-56b8-1171-6aef93f73582@suse.com>
Date: Thu, 8 Dec 2022 11:16:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Validate EFI memory descriptors
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Ard Biesheuvel <ardb@kernel.org>,
 xen-devel@lists.xenproject.org
References: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
 <24a8fb2d-b2a7-b319-ffa9-c5f4e0eca06c@suse.com> <Y5ESt70ylfow4WcQ@itl-email>
 <ea19b0b5-93b1-0608-b771-fdddb275f01b@suse.com> <Y5GwH41ipgN7J7Lg@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5GwH41ipgN7J7Lg@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 8748850c-9336-41f9-e501-08dad9054c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j6zAMFqVppM1hk9qOK4eZXx9Y0vjOE5QgpevqLeIGUJ3bFQLTL2HB6+jxKyylB+6tdJwdRPh4p5ePac4+mAOGnqVyh8JYi/6iGEFBigzxBSQpixmg+jAgp1T+x3oLFyUdGKmWT124sVlARVunIX9J//4DEtvbb0xCZp3fjVIJGOvCJTuq4EoWWn1Gbc09Zoj4eaUt1bSmQs0+mxuRnuBLwwnKqn50Bj166ckI30kCUdBG+97EBzI6Em/iMH6bxskGO+6HbJB52WFLPXXKEBjUxs5YPRTT4BYJ4T9eQRp6nINDG7a8AEElo1pQR8IWtpuDaHdBybIqLRKo+ldMvcLVGnb8ftfYCTSfGKwD276UaB0UZOMgiZxM8hIOZ/pQi8BWYa3OIgXcVe8GIjo48yEilguGj3U2/yRy4B6n4/xpJ1wTTdqQxYQ5rnKAwKgMCq4ps+ATk8DoN+numdQUAcJSmrC7wTyq3eKvDMHC+/r3t/Y6NBQhguAg+D9zHnMbS60v3gE74jq4EbB6MuoAitybQJoW7k5W9FsLLXsi4kR4sezXjtH996hYsRKWWEebSbRehKg/ePsjxEPDxRdSbNiTa0gaE6wVJ+pPS0+m+KCo+qON6vYKSQoPRZ2cB+e0lAKFNv4Q5lYh21tu3fN4f6Lk4liXcNFbJS2OZoIjbqxfRDBXt/LJo343twFLUvBlJ3/CUvHqSLA3e4ZXvnwrx4LxsoRoV1Ffp8unp/sa3rAy+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(41300700001)(66946007)(38100700002)(31696002)(83380400001)(86362001)(4744005)(2906002)(4326008)(8936002)(26005)(53546011)(186003)(6512007)(6506007)(8676002)(478600001)(54906003)(2616005)(316002)(6916009)(5660300002)(6486002)(66556008)(66476007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE84ZWwvZjZnbU1DeDJhdlBEZy9XV25kTEZ6M3gwdTArTW1kTTJpSk5TWGc4?=
 =?utf-8?B?Q3dQZFZXZkhWZWFQenJFSmhPSW1xQnM2SGp6NGpzckRFMyswb0VHdk0waFpr?=
 =?utf-8?B?dFNvQ0FpaVI1cHhsL3pCOHNqUkkwSzdNLzBTSld6TkdkTkhWWkhKSUhPR2E5?=
 =?utf-8?B?N3dGeTBKc0JVd0hyVVEyVTQ4dXdYUHVJeThIMmpWaWNTWmN1NFlBWmZQdlNW?=
 =?utf-8?B?bW51bE5Nb0JDUnljYTJxaDdxaVBxL29vUEpNQU5qem9NNDBDaXdEdjdxL2xu?=
 =?utf-8?B?MXlCRnhOK0hyVkZDYWMrTjhJQ09KeE9RdDFjNHgwanJ1aUVNY3pnQ2VhWU9v?=
 =?utf-8?B?RWtjcGkvT2owVU1CUEtMdUZSK2xIZWx3ZXk3UFc4YjFJODUyUkRoUUxPejB5?=
 =?utf-8?B?L0YwNjllSVFGc1VUVFpwMzNwS2IvMUI5K25FWTlxNmxKQ3lsT3ZwSnB4b2R3?=
 =?utf-8?B?TjlYL0tCRm5idkZiTmg5N0FoUC9VRml5aU4rVS83YmZrV2ROOWZJem5oZkhU?=
 =?utf-8?B?Q0xwd1dmMitnQXdSeHlOSGh6VG0yYWFLRzJiUHM4ZHMwd0Y0dlU2UUVRQW5u?=
 =?utf-8?B?OWYyNWxtUTVEVTE4Zm5MSXRpUFBLNVpwdlVQNm5QZnNmVHdLQnlpNnpYZGZh?=
 =?utf-8?B?QkpQS1RGMitDeHRmeXlXVGExOGtOb3NlWHNsMEVxRzdUc01hL2xKTFh1UzNq?=
 =?utf-8?B?ZXlkYjVjZU9lVFJUckdLOHZGOXRpdnkwNUlNSlRoeVVrU09xZnpWRStyZW1I?=
 =?utf-8?B?UFhCOFRLWWc4ZkhwN1h3Qm5sdUJSRFZCRzhlSStwZzZ3eXNRMmhuc3cza2xO?=
 =?utf-8?B?RkhjZDZZRGVmMzh4T2szdGhHcmNNVGFocTlyZE41UFBOWkR4eVFic3crR25U?=
 =?utf-8?B?dmZaNENYdHhlZ1FwWkcrTGE0M280bXFRN1VscDZZZVhVYUtSdW0vU2kzeEdp?=
 =?utf-8?B?bkxieG1kemJLQ0Q4cDlrcGJrMHZ2aUpCSzV4dk1mK244UWtlQXBqOGlYUU51?=
 =?utf-8?B?ZEJBeDdBTEFuNWVvY2hrSVdLMS9ORnM3TUFOVy8ya0R0Y0E3SVdwd0JKajZz?=
 =?utf-8?B?RTlCcGY1SkNma21MK0pzd281bnBoYXhubEV5aHFOdlRDYXowRFZFdDlHMXBW?=
 =?utf-8?B?VlRmL0JGOTM4NTVBQ0lEelZvU0M2WFRNZWZVTmhCdDBPa2M3cHJnVjVmR1RL?=
 =?utf-8?B?ekk3UGhaYjVPQ2VjQW93blNpOUZHeTFjS3c3Yi9IdE9Lb1VCZUthSzlwdkdo?=
 =?utf-8?B?QWJoN1lMcG9rZjhuN0NnNmFuWE5qeTJmOU5mdnErcVNHZ29XclpNVlhJUmtE?=
 =?utf-8?B?MXZYaVBDalhTSW4wcFdoNXJjYmhMQ0dBNUZUZWdDWWlZNHZhQ24zWmJYVUpr?=
 =?utf-8?B?REZYV1MxL0FYZEJ3V01kWlVCckNXamNzYUV4ZTVKcGpEVktIVlo2bk4rQVBl?=
 =?utf-8?B?YzBFTHhhbnpHMW5rVWpZZjRkL2dOTVoxbUE1ZTdlUmNnYXg5RDRDQTJySDBr?=
 =?utf-8?B?dHJQcE9KVUdOcmZLbmR2VUs5aW1TazUzRUI0cml6R2FnMGhRNURXYkFXQ3A2?=
 =?utf-8?B?UGx6OEZWdkdkWW1QT2hyNDYySzF0azdaLzlOR24vWXhwMkNzdHBUckFCenBQ?=
 =?utf-8?B?VVdKNlZuRnE2NTEyWE9vZHkxS2Vsc1cwdFgycWlaaHRpT1gwM0RENWliNjhQ?=
 =?utf-8?B?REl2RDVGN0oyMHBCS3BQVEphd0R0L0gyTk4vT1VkUk8vNjd4cEtJUjNBUnAx?=
 =?utf-8?B?cTVENnM0M0ovMG1GTnUvemRBaE9EbFV2bDJvK2RxYlc3MnM1RnFTZld4S0dM?=
 =?utf-8?B?MnNLZHFCc1MySVgreThpYmZLN05iWTdUbE9VU1NzdTg4RjYra3ljay8rZ0la?=
 =?utf-8?B?LzN0eTVNZ3RFUzVGMkJsRkxXdXpmSTBIbzdKN1ZpZzB2YkpSS0IvZitrblU5?=
 =?utf-8?B?RnVpaXF6LzNZMzBEb1pvTTNRVUpBQUM3SnF1KzhrQ2EwcXhJa0ZSQnNESXVN?=
 =?utf-8?B?cGRLSy9lUVAyVUg1V05hZzVReFdsUktxZEJ6NXg5amlId3F5alphTVlYWVU5?=
 =?utf-8?B?Nlgvejc1dnVaUHk0OGZGbGdhQ1VLQlgzN2toQURqRnFHMlJlTFpDOExpekRk?=
 =?utf-8?Q?3iVx6H1xoK3AvE4FzlzD8f06m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8748850c-9336-41f9-e501-08dad9054c68
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 10:16:40.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TP65dIzb7C9MTk2iyHr9X4sAEMfhI8pJyXJjYYSmXjMr58aWZbojwvPiSVhVB22yrFpS3okvHRHaTvX00EGypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432

On 08.12.2022 10:36, Demi Marie Obenour wrote:
> On Thu, Dec 08, 2022 at 09:02:57AM +0100, Jan Beulich wrote:
>> Tainting the hypervisor in the event of finding an issue is certainly
>> an option.
> 
> I probably will not add such a mechanism, but if one exists I would be
> happy to use it.

See common/kernel.c:add_taint(). What you would need to introduce is a
new TAINT_* constant (and its associated handling), unless we wanted to
reuse (abuse) an existing one (yet none looks to even come just close).

Jan

