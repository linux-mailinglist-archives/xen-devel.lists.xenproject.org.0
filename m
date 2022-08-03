Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D3588853
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379622.613218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9EX-00077T-KO; Wed, 03 Aug 2022 07:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379622.613218; Wed, 03 Aug 2022 07:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9EX-00074M-HR; Wed, 03 Aug 2022 07:56:01 +0000
Received: by outflank-mailman (input) for mailman id 379622;
 Wed, 03 Aug 2022 07:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ9EW-00074G-Fd
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:56:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60077.outbound.protection.outlook.com [40.107.6.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b639a620-1301-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 09:55:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4816.eurprd04.prod.outlook.com (2603:10a6:803:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 07:55:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 07:55:57 +0000
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
X-Inumbo-ID: b639a620-1301-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTJnEuQHAIMJosoVgCJ3FY9by9K7yxwocnGnR9+nqHrWR7WW/OfN12jw8F9oxY0szFC5yUSrExTadd9ojh+GjwEXaocTcdFX3Z+geC1MhzGSmSdK6kKSvb2rz57p8DaQ7pNt8QAG1bD6gGyybEWUliH4/XyFaXIwo+xxqTMEf5km1Duh8f+Nhglkmf6RA5wDgGAxgZ0Xu+5ifR6o4NocmYZYEAJfg4hu1JtAUOT6yPmDlxo+QYLalpOjN6ktNHbQC8TV1iYkCS6SdkGwNWv6moVQr4HAKY5/ZqHzpCh50H49ITXFkzkpoDNp2xgvvigMiWI36s7HCSph6jGjwJVGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsmHrJogagIIuj9oAlRbDA5UezBuVmy0Fb1YzyhFUPQ=;
 b=J4BmktB3b39zazIjvIC0TLnvji+hjFbgCAZoMZ7GveDkVfPfmJiy2rWP0HU6DDu4g9f+8WVrjkkwhTerwVqXDwaauMi67V1orC6+msQsQUCcGTJLsXCNGMHBfCZzLjO8QmV1GLOj/RSc2FdruWAW9WN6NxMB0sWsXUhYU08yAZiK0TQ/kKnZLdaNuw+k9E96U1WKQ6T2LroNs2357TibHv343oF7pOrb3w7omjhqCFgLIbg5chJ6FJC4JPOCSyqulX2gJqrMecs8lAWiA2q6bsJ3BdAR8qgxlrMY9QG/lEha1Kq/NN0Ce6LAoQM1luB6TKZnqcegczKEDE8XTTnmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsmHrJogagIIuj9oAlRbDA5UezBuVmy0Fb1YzyhFUPQ=;
 b=isNGL3qJZ005NAgBPZinzkuRRvIt88lODZLEj7ZTDQT7Odrvc56hbim+MtxhwJnVZGbx6H0Zu2ORFWXkewgTF0Kfcj7lBY+pwODQ4iHvaBNoqu9EH8BgKnN6WcrVY0U28kMu9tUFI6XiIB4WuSZoB25/oZvUaW3QYQTPljK5Lsm9TpJSJOlisbQJqmqnv7dyYbBNxRUtq1fLlc6mtbsxbcYHYMTK4k3dXOalitSPjiCssf1qnF8EAuo4OpEGm9BuzbM4+eyMSGUnD8szkEyFKHmsBv0maxQR+Q/gwtmiNzJpbD6cuS666+DIhiHphBMdFWN3M5Zy2bY3hYoDI0Ksog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d680c69-40e3-c980-c917-f8c983318d17@suse.com>
Date: Wed, 3 Aug 2022 09:55:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tools: make misra convert tool executable
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <65d730eb0543c507e76b33285bb9d3430662732b.1659444520.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65d730eb0543c507e76b33285bb9d3430662732b.1659444520.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1d4::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d6ff1b5-2df3-44a4-c1d4-08da75259993
X-MS-TrafficTypeDiagnostic: VI1PR04MB4816:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fNoSI+GKA7d3BFZmeo4esMGgkSFKA8R5xGY/K2P7GTGMQFguo8TOjwuSSp6YKs1iLB9SX/0dFdZaHQSa3gQtqqsLugQSUOuZH5dDaSbH3CXUsHMT4yh1FIL6J0i96cXF8AVVHUIu547hYIUFJQgNYeyyfSNt/4aWKdO+rPHfayfjc08sJfGoKNRq1wUNziHkugWFwbHfVByO8X/oZ3NZ8g3HCMXDYEn1vDKfYCobasX/wNMq8COzhjWn3qFjbmEWxRzj4g6lN/BcTKEP2G26J53el/+cLzolO9pJK2/cFienZV1Bvf4emCm1m7ufGuO4TC6J53sru44Dgyi/cD2OLwfPUUDFDBp+/nZM26vWzW4iR75WTTp3HqWfLKAgKTjqu2oG7P3Myky8b3GEXkKNSzGb63kLv0Di4LtdjG/os1h4Mxvc4nsI0qdd8c5NSfwN5RXmzQUvUMnFGB1ooQCFvFunE5e+VAGpl4TDungDPxkwT4wvswyzuilsJG9thN1eJPCQf0H4PutLMp+kt1lQd0CVNPq2tx+1pDoQ36eVjKpVIauFyxYYU8uxGkrfp8cqXlBxKTkvnkl5BqOMAS84es2TMC4gr4kVeP1SQw8E2wbYWzJPQgWP9B+o42mv9+URGx+dC1VldvBm2Sso8qQPWCSLQQy5qoij9fgSHdeTxLceyANQ+4UWLH5cND7NzZBA75L1m2b1yNGPK8ODd+Qz/igf7Q5rT+kuN/Jo8bCzu5NRxbRwFLNUW8JAQyeFKqYQSV7TxVIbB/Za9d8/4QjPUleIuigmxYJbAsxxA7FeyeAmZOyCVKTqmWzvrQ/pDA5SMhbD0F/WEBgzY+BCQg88Dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(366004)(376002)(136003)(6512007)(4744005)(26005)(6506007)(31696002)(41300700001)(8936002)(86362001)(5660300002)(53546011)(38100700002)(316002)(54906003)(6916009)(66476007)(66556008)(66946007)(8676002)(478600001)(4326008)(6486002)(31686004)(36756003)(186003)(2616005)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JrdkdzRVNreENBamJ4R2dqOVg5NXBNL25VbysySTE0dVNCemlpazE2TUE0?=
 =?utf-8?B?bnNtWjFZN1ZpcGp3SHBLODE5NFIwOVkyc3JncFJPL2E4ZW9aeit2TktHZmF2?=
 =?utf-8?B?ai9CcXk1bWQ3S0t1KzZTTlZSeGpLWTFsaHk4ZjNTT1Y3Z3VJeXpBZzZkblFN?=
 =?utf-8?B?RUttWlJNdjRGbldNNjhIWXB6azY3UURGeVZDbVhzdFZOa2lnMStpWnVoN0NO?=
 =?utf-8?B?Q2tNNXc5dG5oQTNOZjM1RFdBUnhueW9XWkU1NXZtZytuZ3VCbDkxUjZqNEV3?=
 =?utf-8?B?a2huN2lXZVlCZEo2cjgydTJpdUJybjhPZzA2UU1DaTBObUtnUVFHVytvNTFE?=
 =?utf-8?B?RklPRXFpNTY0ZE9ZYndUVVpReHVTdm5Pd0p1eUFHdUk5b3d4bHlJUG1lQlZJ?=
 =?utf-8?B?ODMyemhkT2VtVC9tWC90cy84aERGODlGMkZxSDd1MzltRW4vNG0zZi9zbEdU?=
 =?utf-8?B?UkxWSkErU1F6SWJPWHM3aVRqbWhUcVVoMHV3cEFPa083QzhoZVJGSklHTVdl?=
 =?utf-8?B?MTEyc1dsajI0T1haWmRVaThNUXdYajZSU09uZ095d3k4WHNWTjN3Lys2OTNN?=
 =?utf-8?B?WVB6VHJtVVAxd2lRQXc3Z1AvV3U0VzFHVkpjaEZ3S09QeEtZVzVVdjFZNXhE?=
 =?utf-8?B?V1U1YWt5YUZUTnBuSk4xalBlajBka1NrZHF0VGhBUHYrZGFuRU1lZnB3cTB4?=
 =?utf-8?B?QTR1eW9yTFI4Q3hCcnN4QmI2MUpOSWo1amJ6bHU4OFZOemFDdWxUam1JdkM3?=
 =?utf-8?B?cEJTZFVBTlRCRzk5V0R3TWl6Ym16bEFBTlBmYUt0Ny8ydHM4V1MxWWVFMW9k?=
 =?utf-8?B?SlV3bW1yYVYzSEtCZ1pmV3pYbHljUlhLMXhNbFVYYmRzdzIzOEdGMVVyZ3JW?=
 =?utf-8?B?dXNyaWJoTTlRS1Z0c0YzUWtUNWxzeDY4THlWZlphUmNDazUxZkd4azRualZs?=
 =?utf-8?B?M1FJSWp5MWtES0kzUHJycVRFZmNTVUZVV2xadWZjRGdCQXFmRjZWN3h3ejk3?=
 =?utf-8?B?SlJlWFZuRFN1dUZoWEs2T3VYNTFrZ0UydE1GVXovaGFqTHdvSHpLc3VtTW9I?=
 =?utf-8?B?TVJRYWswQWJnWFFtWGxtQkFGZjF0VUVwblRKTExUWERjOUhTby9OeFhlblcx?=
 =?utf-8?B?K2RrajZMY21meU9OVndiTk1JMHJPZ3dyK1lLNm5VQTBTWDZIdDN1WDYvZXRZ?=
 =?utf-8?B?UzlWemVCTkxsS2dON1JNZ3psOTJsRDZza1JTOTMyRHF6eUZJTnVnMCtrTTRw?=
 =?utf-8?B?d3pGVGd6VVk5OHNIcm0rQXF2Z1hoS0JDL01SY2k3UWtOOWhmVDVIdDZNNFl4?=
 =?utf-8?B?VURvZFNtejNmeHpWa0QvZEtROUdxYUkxaXNVZzlDWDlKci8zUTZWYjNMS1VS?=
 =?utf-8?B?MVEzMWRzaGVKYnBEakZLeklMZzRpTllMYVAyU1Bwbm4wNWMzZHZodEJYS2hi?=
 =?utf-8?B?ZEtkWXZ3RlpKUmdoeEJ4eC9RZHdkWlhsaDYyMDVVdmlZb0hnSTlKL3B4eUhl?=
 =?utf-8?B?bU5ZMllWV085YzV0anBJR25oNFRTM3JieW94WXdDSU10NGJXcWFKU0dCSWRO?=
 =?utf-8?B?b2VjRTF4V0xZcmZuNkMyd3BpVTF1TEo4UW45NUpDU1FId0puNU1oVWkzWnRM?=
 =?utf-8?B?MTVGU1A2TXRYR2JBSDdQMXZ6Rjk5ZUxzemF2YjNDR1pILzBGa25xak82bnJS?=
 =?utf-8?B?ZS83SzRFS1VoL1Q1NFMvbWFPaks5UnowOWI4dDVBMm81ZHRrQnRNcDNNUkt4?=
 =?utf-8?B?cXQxYTE5dWc4Sk1YUnlycUFqSWk1eXh0dnVKZDNNRDFjQlZMRzVJSC85eDJJ?=
 =?utf-8?B?cFU2dU56eklZZDVQN2VGY1VEalg1TFZINjl3UDZPZkVJRGtsVzJvamp3UURV?=
 =?utf-8?B?djlUNFAyRksyRjBwcTM1ZHNUKzhTazZzYTJacFBINE5uS3pXR1hWQnZCZVFV?=
 =?utf-8?B?REcwOFpMVUV6bk12cFFRaHFYYzE2L1B6dm56dkxVQVZIQm91WUd5Mk9WY0xx?=
 =?utf-8?B?WGpHWTZkQ1h1MUtmbFdXSXIyUm5pWHgvc3dhUmljTnRjKzJKcHA1emY3aTJB?=
 =?utf-8?B?LzJaRnI2MGlIZTk0QS93a3lGbllvZVQxUzVQLzlGZGs2aHo5RmpodmhTUFFi?=
 =?utf-8?Q?2KcQYaHw4+pKW05ki6sYScH6T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6ff1b5-2df3-44a4-c1d4-08da75259993
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 07:55:57.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WY5dPVnXMYDpUOuFCRFfO0cueN0yQXvZV7mO9C62dIU5J+CL5/IpHH6aHAAQ8p58zo0WRa4YD5KqbmYIZItP5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4816

On 03.08.2022 09:35, Bertrand Marquis wrote:
> Fix misra document conversion script to be executable.
> 
> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/tools/convert_misra_doc.py | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 xen/tools/convert_misra_doc.py

Hmm, the real fix imo would be to add $(PYTHON), just like we use
$(SHELL) to invoke shell scripts. This is to cover for file systems
lacking a way to express executable permission. (Along with that I
certainly wouldn't mind the mode change, but that would then only
be for cosmetic reasons.)

Jan

