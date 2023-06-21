Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFCB737F8E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 12:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552637.862819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBv3c-0003XH-Qp; Wed, 21 Jun 2023 10:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552637.862819; Wed, 21 Jun 2023 10:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBv3c-0003UG-Ny; Wed, 21 Jun 2023 10:27:24 +0000
Received: by outflank-mailman (input) for mailman id 552637;
 Wed, 21 Jun 2023 10:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBv3a-0003UA-Bh
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 10:27:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3431f326-101e-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 12:27:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7554.eurprd04.prod.outlook.com (2603:10a6:20b:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 10:27:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 10:27:17 +0000
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
X-Inumbo-ID: 3431f326-101e-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVdu6LNPbteYd/JHDGFC8qzCh76eGFm7fYsuqi5EM+/nQNsEsDZIlkhhmqZC2ulJVMAe84AEW+PbzKfVTNCoKHUwzcZefimZwOSZ/FeLj69HO7NVQm4DEfZmy6o/DzQx4sA39l228tn+mWqUyoB9NHHiSvTytNV7jM1zR4zMnQ5QmnIaglmfXxFsVJ4mACil6ea08kkCUVNO+Lizq3mqPHzWbpBHcJirZI9QPwGydx5a1zOcNqoAzMHcBKnX0RJ1A95LsBRjmRa9wnYKrwufhgVRpXRVPtXqeYNs27S6i7DscaResiycUrvrsb3EiFkhQF5mp+SzR9Ax4hNa0TDG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9b566oxwptVCUtRBZ3IJydX6QQjKXMYzCi7wsM2nhM=;
 b=KL+lm+LHNigmY2HTOtk0Su0WmvwmfOj0xgG799Ym+2AM4jSb/FFxIiPhM0uiuvp0+5OlQHVLkiV/HXO1QicCFr6D15VvQZuE4aGRx/eQ5rvBC6apDu0i+D2fkDAbAqcztCS8b7nABKjUju1IINZCtMIhzgrMAUosIt94QDNm0+hhS2nee8ZSlaJdcwGvaDJ14eGiiUNVYxnsj3Dcc797dLBeqj6Q4vNSCMTebqOYNWFNQwLfUhJsTh4id3MiCIXrRqC3xM5QctbLK0gSeJ4zktzjq2J0ldcQU9D5dDP6Fqkv6A+R3UzdzAlaUP+U/Y+95KaZvDMqsQ8zupQOcMa6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9b566oxwptVCUtRBZ3IJydX6QQjKXMYzCi7wsM2nhM=;
 b=kGngCoA8mZXoHikZwlldCoqHVImp9bb0BGCxJpn5XTVIOCmWSZ3g8hNDWfQul02eP3+wsLbL6idXisFEcrCkMsHrSAAkgZ6qrAVdSeULShB+m2t6cZiwmFjrt125yZuK/DsCuCu0FMA4UnqtN2+4uzWbrbRkX0V5Jx7Be8B+yhIVff6+ZDSZ//NzEG3dG2xLdBUZNJTDN2mGzK6hf3WF1MSmV0tBAM+ZJJNDJj1/RaJjHN7ZHQdJYROn/dyrOIHHiShb/KXa5GuRS4JBJAZ/2w4E4H11AbHoU8eWm8LNpt0R2iDk7N3AuKTgGRXysi0amn+Ytov9fO9RIleR6PfTNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ba16220-64a6-63bf-a1b8-77dcc847d2ed@suse.com>
Date: Wed, 21 Jun 2023 12:27:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c71848d-6afd-44b9-8c04-08db72421641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Ap2ZvT3bPuS3/TUj8gAbCrs1YuopIt5SsW5vB5JghY+0PBWojtn1MsxnMPHX0nmm13uo6itHq/lVXEhdq67MQdjUa0xiKHgsjaS9thaOvRR9NvgC5Edr9rhnj36zvWAwXwdgt78KOysKUJgP2HT6VXwsSHn4/K7v/6JxUovG/FkA/h9/jmSjmeXTtwLzGDOHiAQECu+VlgwKEsCmGtD1GD+ryBvJ2ZqcBr28SiJhXiKk3ZQS31x6DSUWXRBNFA3PYuvQnn24iBZM6Ic1EUTjPCmvdD34ruFeKBLaAsKnHUVK6hyuAiojjEH4n7rUBz2OYhQiGDU4FqcqTAhoKbyfKwJTO2473rfFsdgW1rCmKCUiUlfzI+tCrDwGiAd4TspC00fYlscTcKUiFSE/N0SUZoW6O+CN4wStJoX2PTD6jL8Pf+OTVplcTDaKuc98ck5zg0tCPyc3D8cSS9RgbucLPUE2Ray4DugHcVwdaJlkuRxQJ+vo19RTeHo0UYH8UIeQaIoy7pg17hnpdbIHbezZ5HfZCUZU0ttkJejqzwqGeJ3UtPczFgUJ7gciajL4rrzaUcmENcSkkHOiQWoJPwQmb7z3I0HMdU3XBMpckQUcrq5maTo76P0HaXB0xH7P8ijA6JGZK+dtzg9w534iUp8CA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(31686004)(5660300002)(7416002)(66946007)(6916009)(66476007)(8936002)(316002)(36756003)(86362001)(4326008)(41300700001)(8676002)(66556008)(38100700002)(31696002)(6486002)(6506007)(26005)(53546011)(6512007)(2906002)(186003)(2616005)(4744005)(478600001)(54906003)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emI0MEhORS9lMjhOMnB2RzROUG1xbFJKejB4VVA1eGhTaVRSNXVHNm9sVlpl?=
 =?utf-8?B?QlFjRUdVTnZyZkVOTzljbThRRTAwb2U2eXV6Um9XUFk3VDZ4VVZIbnhQLzY5?=
 =?utf-8?B?SVl5L0h4dVlwNVpCQTJhRE1QZmlqRkdBMFlXUnhrSVoyalRacUY5ZUJDWmJ2?=
 =?utf-8?B?Q2U1YUQzRFVDTXV3a2U4SmQrU202L1RSMnlXRGdTcW9GUWZ1UjI0UlBJdUha?=
 =?utf-8?B?bkFwMW5TdWM0VitSWWpEM1MxckZjTnU4Vm5lWi9UVXJ5Tnk3MkpWaEpIMFlo?=
 =?utf-8?B?SEpvSjgxOTA2ak5IUE4vSnBCbVpKRDdrbXJoUUVraktKNVZGR0NxNU55WlFJ?=
 =?utf-8?B?QU1qUWZ4dFNUdTFCMW1IU1lJSlNrQUgxNWc3RFBDWWQraUhlOExrMzczVXlH?=
 =?utf-8?B?aGF5amU5ZWdNQjhwMFF2RjIvRCtJeTNBbXlzeUdmOXNtUHRDZytRczlEclp1?=
 =?utf-8?B?bjZHYnlpajZYNzRkTm5tUE5vQmdhSnB5dDJEdWdEKzFIMHFtMTltWU1qMWlr?=
 =?utf-8?B?YWt6WmRwU295R0huRlZyeDhuZ1dSNEZFQUFQZW04ektNL25CbDRQeDFzbllz?=
 =?utf-8?B?K3NobkV6dEFPejhlYVRuRlkvNVZvNzQ0YzJOSzNBMCs1TkpUZllLVGNPbFBJ?=
 =?utf-8?B?aDhSLytQcVd3TlgzMDhacGVUemRaM0JpaTJWUjZ1S25QMHJRRVFiZys0bVRO?=
 =?utf-8?B?ajV0anhWSXRtWXJOR1lKMHF1cFZCY1RQNHVpR3lKK3B1b1NqK0dzeURZSWg1?=
 =?utf-8?B?QldUWGIwcVJGQnhEL3BIN3E0VUNsTXZ6WDE5WDQ4dkRJYkdEZ0hVRmNWZ0FY?=
 =?utf-8?B?Si9aeXc4Sk9qb1M5ZytXY3BZQWNlWmlQcEpldUlod2hKenlPaTFUamtmWmZm?=
 =?utf-8?B?TUFpN0k2UkVWV3hlNkpPRVpLdVIvcmN6dDhXVjYybWNXbnR1MEljN3g5NURn?=
 =?utf-8?B?TVk3Y3FOMmF1TlZTQ3dIVnh0NndaZEQ2UUhpdy9yR2ZTSTZEWnY5RXhlUzRY?=
 =?utf-8?B?SGJqc0pUUWgvNC81UDZSaExjQ1FrallpYkFtbnBaSzFxTE44OGZSZFd4b3l6?=
 =?utf-8?B?VWNFdjczS0V2dWROWXozZGx4Wjk1bVVkQkpiM1JjSXBVRXVHdE0xUTBVK0dC?=
 =?utf-8?B?NWhSYW9Kcnc1Qkx2YVlIelRWMW1wZm5wczhxL1ZNbVBETENUZjdPMU5KS0Yy?=
 =?utf-8?B?ZDhMMmtLZ0Yra0xnVThZSitWeXRTOGg5OG5kajZWWWJPOFBIWnFtSHNwb09Y?=
 =?utf-8?B?TEJ5SkczUHRGRi9qYStESndxL1RSdDl5aTV1VEpQNkJ5ckdhR1BNdDBVSTdm?=
 =?utf-8?B?b2dtMlVKbTU0V0RqUEJvWlNmRk9xdWNHYUNDVEgzTE5FN1VCUjBrZjZ5RWZw?=
 =?utf-8?B?ckZqOXl3eGVqcVN6azMrOFlTaE0rT2J6RjE0QWtZbVJHZC8xUEJMc3FTQ3VN?=
 =?utf-8?B?UiszeE50VDFMa1VnREtRWmZ0bFl4UjVTM0xXOXZzZkdNRFZ6ZjNKOXFrM3N5?=
 =?utf-8?B?Yzk4cU9ydGdCa3BjYkx4Y0ZIb1pDakZuVC8xVGJjb09qT08yTHRHVlVaUHdJ?=
 =?utf-8?B?TGdkSnBCenExazM1SERpaXJKT0Nmdkg4WU84ajd4Nlg5SEovYlcxdW0yZzlk?=
 =?utf-8?B?aVNpeWlFOWdMUnJmbjluOXl2U0tGNHN0UVF2bytqdDVmMUF1a1RoZ2dLNWVD?=
 =?utf-8?B?Vi94dEF5eFhHNWl5TWpRWi9raEIxVmxYVlZuYVVHeTdHSEN1d1htMEw3OThU?=
 =?utf-8?B?MHdWc29pZGIzTUpKeUZPOHJENjNkZVU3QVZnbXR1cEsvdkZ2QXJUOW5KUlE4?=
 =?utf-8?B?aXBISTN6ZVlKUnROd2VMUXJRQ0tFenRpR3FTdXE3dm5LOENVTnQ4SG01aHZO?=
 =?utf-8?B?TWplVGYrL2dxeDZqNnhvTEY0VndTWDh2ZnhjcWlZSkNNY3RHRmR2UWFxRnVs?=
 =?utf-8?B?ZTNsUTZ5TSsvWit5aEdXcGVPRWZyVS9Icngzd2p6NFliMWJCWGRZY1M0OFhK?=
 =?utf-8?B?dTY5OU9TRVBvZU1XbnB4cUhtTGh0cjNxK3MwRlMyeGozdTZYbS9yNkxpb2JN?=
 =?utf-8?B?ZnB0S1VQMHZRbkN3b0c5R3BmejFjN0xpV1hxU3Q4bzRFZGFHNS9yWXNzT3Bv?=
 =?utf-8?Q?3+BKCrhgoUwfBloh+j/xFu51f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c71848d-6afd-44b9-8c04-08db72421641
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 10:27:17.1610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lBgqdWAClNXH2MofC45TGysjeEXEeOj2nZ3PtF0m0rhf2duuDzIxLTGZ7nRRZRaNioNqkLk51Dn1wG1rYgPjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7554

On 20.06.2023 14:10, Roberto Bagnara wrote:
> +   * - static function is used in an inline function with external linkage
> +     - ARM64, X86_64
> +     - Non-documented GCC extension. An inline function with external linkage
> +       can be inlined everywhere. If that calls a static functions, which is
> +       not available everywhere, it is a constraint violation according to
> +       C99 6.7.4p3: "An inline definition of a function with external linkage
> +       shall not contain a definition of a modifiable object with static
> +       storage duration, and shall not contain a reference to an identifier
> +       with internal linkage."  A standard-compliant C compiler ought
> +       to diagnose all constraint violations: when it does not, as is the
> +       case for GCC, the behavior is implicitly undefined.

With _spin_lock_cb() taken care of, do we have any left? Or else can this
be dropped?

Jan

