Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08776991D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573099.897471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTcZ-0000tP-AJ; Mon, 31 Jul 2023 14:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573099.897471; Mon, 31 Jul 2023 14:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTcZ-0000rc-77; Mon, 31 Jul 2023 14:11:39 +0000
Received: by outflank-mailman (input) for mailman id 573099;
 Mon, 31 Jul 2023 14:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQTcX-0000rW-Vy
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:11:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2945db10-2fac-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 16:11:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9488.eurprd04.prod.outlook.com (2603:10a6:102:2af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 14:11:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 14:11:35 +0000
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
X-Inumbo-ID: 2945db10-2fac-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hej9dmuLPp71GMTVEInNFFpijvd4dGoyTsfks5mbj18HEo1vIfkYLFtcw6HY51Er176ow7GridTL9O8KeMMi0kXCuRtApaRuIQy+Ihi39VsGl8PGMvb5U25ZkeGVtvdWFkOmTtl3v9PqzzGv7lTaE5xcFMPrc5maakYwHF3/efqkx3BpoS+S82DVLWg/+1kSxT4e2tcokFl4POo6etvNOGxqvvFjU4U3jTrLMW9/V0H/92/Q29sGw+xCDgZbCCjnBzQL1hooOrfvuCrNwSYP/ITeRPtR4v5VFJ/NfYlU26fJq/mQ5Jg45kZhoy4YIXjTQYUxqcp1f8xSnbnXlRFRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNA3P3Y2g7sHUu5TisRCN8jMhK4/h6k+Ws8eNzjDEnM=;
 b=Xyn4mJmEcY3dAfRdTJHE+IWagedAtt5idEMbjUWTzuHolzEQf7MyXtNDQDDPoqylaOI6Lk6QaZ1nBeMOuOjs+l7hguCp3EWrhJ2Jre5EA5efNNDoA+Es17Rp6g5rtzDCAIUSo9ydzDVOFgI8l88HKxVICErrRoiHJgDTfTnbqLTIG+Z9wRR8qxk7R6aY3npzY3HvMjLmerHHI+/ZO7fkoU8tqmt1WgVqDfT93NJLpPe3PZoGunV4KUCqjLNxPRAsVl+h8jaZaDcKMAbmmyRRMhAnaWH0eUEwQ2lPBjOnSAzu29L0Mzd/lvn38dXrh+g2ISEi8Dmiw4f6ss8EeeQYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNA3P3Y2g7sHUu5TisRCN8jMhK4/h6k+Ws8eNzjDEnM=;
 b=fhYAnqoN6sCD2MVtuvDY+6enT7r+7hTrJ8tnHnj7mW5hZE3iOdwNRCY7MThNWKiEc6r1nn1/Zer9NU+eyJKj6cOpt6GsTBRCYkwYNa40V2sXaKTD9S9t/gczZ70o/vK4Skwk6+wxvQ9vUaBQw2BJNwK7dhL7j/cliTB7eCZY+VOI5ib9JFhp/UxvbzZzDdFMUa6GRw6lkcL2tkt0Og5sSLyAmvoEblpFgV5A71pHE5dLkShU5Lj/XgoJH0Diu2J8JCrWULNt/wdkcSyZ1sh+c2FqGcSpCDQr2g0p2hHPOllc5U5JhbK6nrIGP1aqBvgY8i4MiPb6kKjEO4Bc2FVVVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8757d4b8-7765-e50f-73d2-34c7c34acaa5@suse.com>
Date: Mon, 31 Jul 2023 16:11:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2] x86/hpet: Disable legacy replacement mode after
 IRQ test
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a112f0fbbb333fc29a35d0a81853d59409a33fde.1690798460.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4dca34-dd27-477a-8312-08db91d00c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UI+g2/RGIA2fh2GWT91bu3GH9N9DEQP87FuPGCampIU21wGUmGR8FK4l4+MFv0/E+BGdkrZxiuaTBfMF0YEnBsOtkzEz5zBRdCX5Lqyr+tur/jTaJKa5vjKebXyY8I1TQzH7LsQR9ypIG0LRKnQHiXoqqFq9itNAvcbYWYUSZJgZQMa8GmwOzOI571qMlW8MxhYoU+5SGSF+rkvISJ2Y3JBAoSwnyxT5UQi9tpcWYqOnfRFeXxk754/5XyCIfFwBOA8g4bEnoTPbha1vtfGzrtrWXdjGM4YjFg5C1fiJKR6DaA7j7UHMT2lAwoTe1hQrQk1/WGPBYoViNHOwzFqt8kSggnsUyAKnDcOWG2jPv2gFjw4Gt6rG5/ozTIdczFVUicUS3rpBbsVvN1R+xczyEPm9VGty+VPu8LvUZnjKKs1+fyriAukkWsgaoSe7GuAivt8DvTQCDiPc41PINhM0xr9VpwBFOgF++3ioqVto9a3znQA96hmrWLm6JTSQ0R2uGWAq1JVAsHJJER/xqK6Sz/OwN0FFqEkg9XUWWe1fiaqhuQRSHHjHGKZLMTTAD5iJLO6obnyxSkfQ4i/baUVpUFtV6g7DPLj6/buyZDA4dLzpDXnA5GZylx6zW32Yp9BDzrVMdOq6otK46aYZHCHWtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(38100700002)(36756003)(86362001)(31696002)(6512007)(478600001)(2616005)(6486002)(53546011)(186003)(26005)(6506007)(8936002)(8676002)(31686004)(5660300002)(4326008)(6916009)(66556008)(66946007)(66476007)(2906002)(54906003)(41300700001)(4744005)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVlPc1pIUFpzT1RoVERaUlg5Q2ZpZUg1SXhhelpHSVlvUWxIKzNyTWsxdmJR?=
 =?utf-8?B?L1VENUpSb0R4MGRJeU4rUDJRR0I3eU9NbkM4NnY1ZGdma1lITWo1dkNEcita?=
 =?utf-8?B?UWdXYUlTV2xuMGE0TnU1N090OHFBblNnTWp6MzA1bHZnUEU4c2o4d3FPM3Rl?=
 =?utf-8?B?NWRZaGJ4S01LYmlzZm8yVC9rRmNEd2hOWlQxVW84UW5aL0owMHJjUy8xSVNQ?=
 =?utf-8?B?L3QzYk1yTUNMWjYydUZzNVQ0UkgyWVVqZ09zM3ZvK2ppT3JkOGdWcHFydW4z?=
 =?utf-8?B?U2J6L2YrdHJWZnpCQnRGSG4wYkYyNkJPeWFpOFFHZEZZOS9mZHJUMDkxenhT?=
 =?utf-8?B?akpiamZvVmhtQ0RCbkN4aGhaZW54d3B5OHhpRExaSEtJTmJOYnRBYjlaR3J4?=
 =?utf-8?B?OU80cTlvNE5BdzVNZjFBRjlpbzN3UGpiK290bkhrSHpmeXdrSUxnM3UwblBn?=
 =?utf-8?B?WUk4ckg1Rkw4LzJBdDFXSUNLRitTTXdwNDZQTmRlZnJYalg1QU5PMnZkcnpt?=
 =?utf-8?B?TzNlUS9weU9kaDRFdExrem9oSVRBeThJbHZrSkc3MVlWK25Va0tRSjl0NVBx?=
 =?utf-8?B?SFo3c2JjcTQ3UFN3MmhNU09lTFhuaFB4cW1HcUpYZG51eTk2WFJOQTZWcTQ4?=
 =?utf-8?B?VFV3SGZJdGlmTzdrU3kxYzU2azJ3M0lJVzR0SWUzZlliL0QrU2hXWVZMMjJl?=
 =?utf-8?B?WjRSS3R3YjRFTGloN3A4ZUZNZkVPbXpERVZLeWlLdGR2WTh3WjZFWEdsTVRL?=
 =?utf-8?B?ZVFTRWRQRGVBNjZLeWROdE1jRVU4bDY4clR1NjdsS2dLYTNubXRMK0lDOE8x?=
 =?utf-8?B?UUlIMGh6dVphdVhVV1d2V01jUjI5MzVvU3pLWUlaaFJYNVVnQkQxYmQzNDg0?=
 =?utf-8?B?NkVoQ28vbTdwVm04NGxHWXZmUzJUQUhhbkdvbW5NQWVaeUtOQ0NYNlJTSzRN?=
 =?utf-8?B?MkhqNVg0L1FVcnhnSXdpbE5QRDlkaGpQbVNSdUFUZkJLRFJSRkhjK0hzQm9v?=
 =?utf-8?B?bVFtRHg4dDVOSHRxUkJUTUwva1AvbHN4UXdHeExvYkUvZHpROENKbXA4Z2VZ?=
 =?utf-8?B?TjUvMWZVdVRIM1p5bG1SUGpmKzJwSVhZaHJacDI2ekpKQmNZVzFSYVpyeVJS?=
 =?utf-8?B?S00wenZueGMrNUdMcmxnTFZsYVR6ODI0SU16NytSTUhWY2xsZ3p1MVZLc2h5?=
 =?utf-8?B?aWhBRnNKSzJCT1JGVUpSUVJSZGRnYk1LWWVOb1BId2didGxOSnduUUx6Ykx5?=
 =?utf-8?B?TjVZU3pSYWk1b3E2WWVzUW1Vampxb3cza2prcWJuZXZlTTVtNGt0TGo4UlZv?=
 =?utf-8?B?UnZ6bmVJSmRyWExrZTI2RTU2bVZTa2k4Z055ZjZZVnloQTREaUJodjNaMnNX?=
 =?utf-8?B?V25RRXp0amI2MURDV3ZaQkw2ZDRGWTc1aFdzREx5Q0JBeGJ2b3pwWFZzRUx3?=
 =?utf-8?B?MkdYUjIvSytuRXVmZG1NTkhtUW9yaWpkcnk5U2F2M0Z0aHFaNDVzajN1Sjlz?=
 =?utf-8?B?V0hwVzIrdU8vT1dBOEFPTjN3QmJpUUpuQ1FtN1ZTY295ditvQmVQdTQ3NWFP?=
 =?utf-8?B?NTZMZys0bWJJeUZMNlEzUFNsMFptY2w0amhEVFkxVEl2Z2psa2c0K1Q4N0Ju?=
 =?utf-8?B?OVkwaDlrOWlwZkR0aVA4OFUxWk5WQ1ZjZzRGbjkrZnluZ3BSS3FQTmpMeG9L?=
 =?utf-8?B?M3VGZUt2WnJSUy9tSEo4c2dYWkFWTmhiMlhnZUQxVElJUUlrTDRNZlRDckpH?=
 =?utf-8?B?L01XTzJaSzdodStRRzk2cVFJWUJ6NWJSWEVCa09rdmNPdUdUMjcrY3RiR1ZD?=
 =?utf-8?B?OWpDdnEzV0RVRVJ1VTZEN3E4UWtEckE0ck5LTEdDYUpINVlIc0J5V3F2RjFq?=
 =?utf-8?B?YUJLYW1wTm1TSk9Pb24wc3lkdkgzeUoxWDh1WGN0bVd6UnFzd2pvU3FZQkQ0?=
 =?utf-8?B?bjdoRG9JS1piNkZCb0p3OVp2MGVyRWt4WXlZZ3JoM0xUZmMvNFRVS2xpUkIy?=
 =?utf-8?B?cGZYOFhPQjg4d2tyZEhWd2hSQ2NXNzFJWDl5b2F3VnlJTUp3NlJFcE8ycG9Q?=
 =?utf-8?B?aFg0ZUdjaXdNSWdTMk9LVVNLbXUvcTFBa1ZHSWY4WUZHOVVPRUFzczVuMkZq?=
 =?utf-8?Q?fu9DWhef05wBPf7D2Ig2hWiJX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4dca34-dd27-477a-8312-08db91d00c85
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:11:35.3471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwxEsuq9gPV4THZ5+1h+0Koex9v0fjMto27JulxV6h1xvFU1BIysLJO0dPP5foBSNl/W/yGDeZKZF8T58A+7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9488

On 31.07.2023 12:32, Simon Gaiser wrote:
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1967,6 +1967,8 @@ static void __init check_timer(void)
>  
>              if ( timer_irq_works() )
>              {
> +                printk(XENLOG_INFO "IRQ test with HPET Legacy Replacement Mode worked. Disabling it again.\n");
> +                hpet_disable_legacy_replacement_mode();
>                  local_irq_restore(flags);
>                  return;
>              }

I'm not sure of the value of the log message. Furthermore, considering
plans to make XENLOG_INFO visible by default in release builds, when
not purely a debugging message. I'm curious what other x86 maintainers
think ...

Jan

