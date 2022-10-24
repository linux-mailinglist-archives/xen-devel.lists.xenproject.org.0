Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316A60B0A9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 18:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429254.680170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzyf-0000Is-11; Mon, 24 Oct 2022 16:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429254.680170; Mon, 24 Oct 2022 16:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzye-0000Fe-TN; Mon, 24 Oct 2022 16:07:00 +0000
Received: by outflank-mailman (input) for mailman id 429254;
 Mon, 24 Oct 2022 16:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omzyd-0000FY-Fz
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 16:06:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2ef8f1e-53b5-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 18:06:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 16:06:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 16:06:56 +0000
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
X-Inumbo-ID: e2ef8f1e-53b5-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPCvP761SPk0gUeX20qgGUyorRvQvLc43QTVXkO7bNt5HT7ZzSSuioSF3f26MW9/sh7JUetDCJjXMLtIDPSo5Okx5nSBLNNnvOhzV+iZ+0D/xrIVPyiytXiosd1qhiixb7hNb472jAAGnJemy4by/wCfkiP2IrRvJO4HgIl5WcQC+JTwU+v0eOr5MqSE8KwwHmX8L5TC4k38OsQpOs1+V8tq4ZUiCrLXh8oyswXVOxF+JoUPKpdd+DuYsjdpxtbM76L8VHND92k+YjBYj4SMNvLHASO5ORpV9P6QPlaZ+eWPbdtG5MO/FGXmh3Sl8FRepXtjSHW+Yn5zImTC0YAupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixLkR1K9Q55B9dQyLI2XMpKJenS/ngAxUQrrBiLHQss=;
 b=ltU+oNFbLfhV+aWobF/JFqJUgOBD7J1EIFjT5f6HN0lEM0Jx+diqGWbCR88yXSkw3dpn0gMnBc4JUUvbu2mHRyU59T0nFl1vRuEG/bbTkVFJUnnt10m7hyovHNl4H1g0Jg0xftcFMgpm/Z68e1lALz1JTlrVK8+ZqDWnbObpAbG0BZAXoUdchEFpVc2xFKmLfgOk3lgRgFSc1Qaq8DYziK14JCb/zplwfaezJyRPD81iHlocg8qJ1v7UvBbDL4JEGyRwtLOZdZtiIMZp69LHft5nx8TW53iJ3xPdQtfyzTJxyu50fBrknlDS5iyKvHGuHkS4UmWkOjLAiYya1IQb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixLkR1K9Q55B9dQyLI2XMpKJenS/ngAxUQrrBiLHQss=;
 b=de5v9rvn3afcrTr4oqG8SEumTYbDCHrjfU3sAs28krS90GdDz+gM3G+ZCY55vd0OTS5KMlFy+IBJlHsMQ2HVUw/jUFi0TM/E46iN4LBKtnQvWKG0M3vFsXLSjrA2mvUz6agL1g/0CumXWoWu9EnhjHapvIVcEV/DBpFiNSmHdplNpKum8jmbbaWTCF/RyTvQ1GXR7/QPoUutUso7L/+zaRNCJcETr4F7X4yJ9f8iJ9Y9UsTA/wPfDe3CNfs/1Og+n/wvYefnKhNIY3hVZ0i3aaCgbf+w6l1pQhAvrNbdJLp6tAqtRvFS5GqupdfRvUD5D2jYrlJHLckQ8jVqGg8q7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40a4b054-1f1c-e87c-c909-93f0bd4b7ee5@suse.com>
Date: Mon, 24 Oct 2022 18:06:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 3/6] vpci: don't assume that vpci per-device data
 exists unconditionally
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-4-roger.pau@citrix.com>
 <ff8559d8-12b6-9218-94bb-8c9a731250a2@suse.com>
 <Y1a24cSD9zVZFHn/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1a24cSD9zVZFHn/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c17b42-a27b-474e-55a8-08dab5d9c65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0H5G2WgNwaXnLj5rPym+Q5pmwq9J/ES/4MnT3LsXW+n+TkeFFiQ+ryUNPjmsUo5b75Imck7s+PfOZ6fziKgZ+z8wY2vW23nMGqzX42cGfVw0bpxBy2ZmVrM7z+5jrMxmw0KCw94+i1yH8Ed1ZjzFda1rEPXLoPzkpGQ/PTKZBB2/wkMJcDz8CRw6DIHG06aZ+4aKjck0HvmMXWaSTO1pByF4bLgdq98amaAUcY/JBqQb/zSKuFVyWSIBO/MjlycfGSTeXmJfoYy3ltNzKS/mWuCMu1teRIswQ5MqLz9At3kKw3DSS8uGZ6vTF+xhMR2YnyvxfXWakla2fTgvmkrr2BL6Gn200oreOmhu+QEXFA3cu+6a7OsGoOfBjwsqDGR3VGEbq+zh9hrS5zoFufUqBm880AokS31Qrx2yNNV8YCJtSPaS7rLadsUMsgRM+1eADGLy+r34W4/hd4weRfN//jw98lZiQJjUR6OruSdYvGD1QNKvWZX9DSCvxLttRae2t63h8XqQqKCEf0Qw0HCQSPmVX0HHNaHNEzvPLgLWa7Zg54f++VuxE3bMaLreKvQDac3MX2OY84w2g2Uxb+nyVWnZ7gwI47uKVl4ApzZrPd7VtUDAmZGPXRsNOcptJlL6VIBAU8adIbal9s0h1gl/hEYMSODhXf4RmtqrgfDqmn5WZYcOAF/ESKLjI5ppnWi9jGw93jNEo0ewObz4sVszeQ8JelHP7dLDGklZObq9/dj0zemPmnHBuPgwDEekcWnR08yMkzLZ2OLrLQTcKd7GGQeEDw8UuTOHUMQmZfckuzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(31686004)(36756003)(86362001)(31696002)(2906002)(38100700002)(186003)(2616005)(83380400001)(6506007)(53546011)(66946007)(4326008)(6486002)(66556008)(6512007)(26005)(66476007)(316002)(6916009)(8676002)(5660300002)(4744005)(8936002)(41300700001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0RDa1RrL1RodkNnK04vMjFjNVU5WTU2WTN4a0kxeTJtR1JudGx5VHljU3BD?=
 =?utf-8?B?bFVTNG9EeVM2Yy9CclhvTkx5MzlLR0lPaGM2ZVY2ZnVpMENVSmhBanV5YXMw?=
 =?utf-8?B?QVg3YjFHTjdkenV0M3JVZVpoNVQxSTVIWXpCb3JuNTRlbHpISXlaVjBoN1FY?=
 =?utf-8?B?MjQvdVpLOHpIQ2h6WDZ2Y29wcTBBNnRDd04rWERPYk5EMFZwWXhKcndEc1pR?=
 =?utf-8?B?RTVOcHJvZFhBbkt5bUJGcnJFaGpPWFdJZEl0Y1BSUGNjaFUweGQ1TVFKMitI?=
 =?utf-8?B?cVp4OGkwQjVIY0JoRWYwVDVwSDYyN2VCUExHVTRWVElma1hsejJrUUV2THRm?=
 =?utf-8?B?WFBmTHRsc2JsTkxaTDJTUXY5UHFsanNicHkxUlRQUWJjU0t6KzN2R0phZWhS?=
 =?utf-8?B?dGxJYWN0VXBpTThTUmQvK0dNeE5hQTJCMmFSRjRkenFtTlVFQWx2WWFKbnQv?=
 =?utf-8?B?dVZFSTRKWlhIMERZK1RYMWV4VE9kVmNHYTQxTnBhQ3AxN2tRMnF6eWRaQ3VW?=
 =?utf-8?B?Y2dObXlPMkc4a0dwbkt5V1V3Y2ZWM3MrK3JxZXU1TmpMUzRjUm01bG9uMzBC?=
 =?utf-8?B?SVpvbFRGM1NFWjBPbE5HOG5BOWZLek9QT01FSFFUZnREcW0vTDg5SktnaDJK?=
 =?utf-8?B?VisyOUhmTloxSnFkSVN6U3NkRHJuNXdQbmtpWXhadjV3WXJBaExIL2ttdm9K?=
 =?utf-8?B?Y3VqcDltYUpiRWlhSERZT2RKR0xvbHNobVBJMlRwYmFkRXJzVVJVU2s3Z1c0?=
 =?utf-8?B?M1h3UFN1b3pEa3lWRFJyQUNIUjhZa3pFTTB4SkVUYnFKS3pIVzBDUzFzT3hi?=
 =?utf-8?B?UTgxSTdIS0tpVmtmWDNqVGZYMmFnSnpkZHcwRE95U1ZGenhhcWRteXh5eFk2?=
 =?utf-8?B?OGcwU284ZE5KMWcvUDIrcjU3RnhweVhVdE53QlZXMUZheTZ4MG9jcUM3eDg1?=
 =?utf-8?B?UEM3QXJHbVMwK0cvckdrMjZ5L0picmpwS2NLTlc5SjJpekc2dGhlMVFadks5?=
 =?utf-8?B?RmxTSm1yM2lVVVFWM0dTaUgzamlGWE5TcUpBRXlBUFRRQmxPd09qZTVVVFli?=
 =?utf-8?B?YW9CMFYvbVJadkt3OVpQVlNHMU82am5hNVRPVkh5Ykk0dCt3V2lBWEpsT05t?=
 =?utf-8?B?SXp1ZUJNbTUzL05LK2tEdkxDMS9COThDVnA5bmdLTXRvVlVqaUhab2FOQjhq?=
 =?utf-8?B?bmlJZmEwckhVc0xUb0RuSjIvYzRWQ2JySUpnVUdLT2hGcmFESjROSWhtZ2dy?=
 =?utf-8?B?WWEvWW9IaGU0MmYxU2VlYW9Vd1JSZzhzS3FHdDdVVE5TeUZJQm9IMWk0d3Y5?=
 =?utf-8?B?ZjBrZTdHcjFKeE5CbURLanA5cHBYemRHcDFPOUEzeUg0NCtDaVBGQ0lMc3h4?=
 =?utf-8?B?b0ZxK0lPbkk0ZTdXK1k2TG1JdUJIS3hQWW9Md1dMOFZrR2hOMmlaZzY2cXlL?=
 =?utf-8?B?QnlSdDZQczdOOGNMSmlZOG9RakZlcCtUM2xVMnhXeUJpemZFZXNZa0UyeWxW?=
 =?utf-8?B?azVIOEQ5SVJZKytlYXR6N2o0anIrOUtyMFdDV3RDMlRwTDJuUXQ4dmNuZ1hX?=
 =?utf-8?B?QXozNDllMFBKN1BCWHR2MStWMWhBMXhzNjFVUm9Ub0dIVXN5S2oxMWUvWjQv?=
 =?utf-8?B?UmxXMjJicHpPL2hwT21UTU03a1pEWDV4TlBDT0hFeHMrV2pudnBFTnVYa2ha?=
 =?utf-8?B?VDMwSytDR0ZMcUMreHowVFUyU0Y0T0U3KzF1OTZyQnRnN3lLcDFhYVpOa20x?=
 =?utf-8?B?MHU2ZWlETjRKR2dra2trN2hDaGQxZUkrcFpyRTd2SDlIeS9SYm1PWnRKcy9P?=
 =?utf-8?B?M3owUW0zOFYzUnhoYzJ3YzdjdDF5djA1TWdkcEhKSU5pcjA4cVJ2MXFiZEpT?=
 =?utf-8?B?d2ZYTEdaTHdJUjl4eHlMaHJwRTBWVU5GMzFaUDZENjBQWGJycUFnbTVWbDdE?=
 =?utf-8?B?TzNDcThtbUJBVWFUanlDck83bWk3YTZucm4xck1rYnhMSVBtdGpSNVFJa2lV?=
 =?utf-8?B?cW96QVFzQ2laZ1lVaHJMNWZiYzI3bXdSZ2N3ZjR5ZHFlZHA4cXhzK1FUcUtK?=
 =?utf-8?B?WDRYbEdpYVNVaWVVQ3MrWGNpMlBFd3JqR1UwVlZKWmE0NmpPalBxRVcxSm92?=
 =?utf-8?Q?OCuFfk6fWw9b7NK9V6IpvichE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c17b42-a27b-474e-55a8-08dab5d9c65e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 16:06:56.8510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcDHG5rZsocYWndhdueBRCrFojaHpmW1y2qHmGceS7FwM20v3QLBrCr6TeFlN+4eywgfbQT+UDtguBkCXALLLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

On 24.10.2022 18:01, Roger Pau Monné wrote:
> On Mon, Oct 24, 2022 at 01:04:01PM +0200, Jan Beulich wrote:
>> Furthermore msix_find() iterates over d->arch.hvm.msix_tables, which
>> looks to only ever be added to. Doesn't this list need pruning by
>> vpci_remove_device()? I've noticed this only because of looking at
>> derefs of ->vpci in msix.c - I don't think I can easily see that all
>> of those derefs are once again immune to a pdev losing its ->vpci.
> 
> I think you are correct, we are missing a
> list_del(&pdev->vpci->msix->next) in vpci_remove_device().  We will
> however have locking issues with this, as msix_find() doesn't take any
> locks, neither do it's callers.  I guess this will be fixed as part of
> the lager add vPCI locking series.  Will add another patch to the
> series with the MSIX table removal.

But the locking issue the isn't new then: List insertion can also disturb
msix_find(), can't it?

Jan

