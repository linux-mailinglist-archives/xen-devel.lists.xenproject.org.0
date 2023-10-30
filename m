Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1249D7DBC82
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625193.974223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxU6N-0006Oc-My; Mon, 30 Oct 2023 15:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625193.974223; Mon, 30 Oct 2023 15:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxU6N-0006ML-JX; Mon, 30 Oct 2023 15:22:51 +0000
Received: by outflank-mailman (input) for mailman id 625193;
 Mon, 30 Oct 2023 15:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxU6M-0006MF-62
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:22:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f3f52b7-7738-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:22:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8184.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.15; Mon, 30 Oct
 2023 15:22:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 15:22:46 +0000
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
X-Inumbo-ID: 2f3f52b7-7738-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax2XOwWoE8SoAXof9VkX2mDx6kkpJkGMcHCGgwn0ihM26DbLqmk+AQM4xF8RXf8Qi7AjbMPUqzD/jH59KG4rWLr96nbpVh0UNhl268oQp7Jj/Y1OI7+jRzSecFjIEYn98g4t1TJP+R7toK0LW/IgtMWVqv/lSSO6FhUJHRtf9xS7FPeFTOIcpB5NrXw7kUdS6L3vJ9tv8NDIJEkcK3zlBfkaJALT9gj65OEQcuGmRQoYgYN8xiJ1itYJMk6Nw6/iONa0k8VnZHA5YMiWMi73LJ5/QicjXzpqkoGeb0DgOPHIktYSWKhYB804PAioBWHe2a6lr1wKKYjlju3g9U2xSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5eJgNAarf01l8HJko6NigK4Gg5ZuB+Gyc/7tHfGWBE=;
 b=jQmLC6V7iuhs6RAm8KuMsPX6YnkjB3z+6lLpkqMq4FezRQmtw3CISFgCtfSMFEOdobmR56wJ3hb9UFKWUFMi467AsMBJO1oF08W8whQQ4PI3Kpdng9+qVGdHob2N6rWEvOZvddRD7jcRLAmAhDiRftTuQZwLpOOwvs7KLn6F/6O2AMQZSlvRniQ76otxxWSRqX232Zrz8wqFUV9y26/qUpba1zVLy2TTtVzVwrFgm4OVmqnBDN6+S1RJ3kl+AQtYHXd+mt/hIWlOLrb1WnDfEMUlgkFrIgGzTVl5COVXoJ05MZ8sFXdKoEfixs3ATKzEvbL008q2+pnh1BCTUhEKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5eJgNAarf01l8HJko6NigK4Gg5ZuB+Gyc/7tHfGWBE=;
 b=t2YOPQ67bB0nfvqBpanZbp5QDsLpFB+0j2+3Z3n4W1i47G4ZXXsYTrUhHZHr6th8Gk7yt7qKXPAHdfqMm2IoZORbU2XrT5ozTJz4uxae/NljzafAMlnprmI0SrlAZwKQx29BVNH1vI7urFtzw+pjzbpYC3OdCkuGcEkShE1KBlDFpCY5ZcTJpVFgeR9z7TTAKufuy7JjIXlHTBX6yxKVLlD5Lg48PN8X2ogwxO4apxmzwKH/xOm+CtlmxO2PVp7vCB4XkdK9jJb1ggjIOY3ejWBNGfVn3kiGW/ux1p+c19gLD4QponuuPdbYe/gd/g7h2PvybjNp+Ct02vid99bD0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b52d551-3c42-0769-f421-c8ee414757b8@suse.com>
Date: Mon, 30 Oct 2023 16:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 4/8] x86_64/mm: express macro CNT using
 ISOLATE_LOW_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <8e56caec1dfa2ef9a528d58935f16c537adfdbea.1698410970.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e56caec1dfa2ef9a528d58935f16c537adfdbea.1698410970.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6508f617-193b-4062-70a5-08dbd95c11bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vf7UZLfxtFeCqUbpTY8iwK+//ZQt9VFZAEy2HKI0l6fHtq1YE82LtCYaNeGERdDthcJy+YhYu4eAhGS+9wBTC84mubC1Kc0iJrUzH/lXvO+r/wEwBZPn6LbdgSi7FIjiRIfbjak/Oh0Y9LFkAEI4DlME/J6PgGmpsNpcl5Nk+oIka2bc6yrtJFLsVC97EldGWp9eja12sz0vTJOkdH4pOrYACRBwJlG5ugGeFP7tc/daCGUGTF7ztDixoIaPgobrnq9wszfSDtQ5ruFuXFbdZyI1R2Wu4CWb6V0VG1V0SEsod8E5sOUwFq0U0/vryCO0s8GNNW3BhfI3M5xzZ+8OV0AirUTTp0rXkt+kowSEuii2LyF7BCi7LyvfBTYpGL3RBybViDD0kqbGmN6W9vJIJOrcMzIGKgkNd1bfixTcj0Xx7Sha9MxMKFgkPThg4PimrMD1Qm4oTixs/UZ7E1ATQmOZUqfLe/4OHo25BUublEJoVVgfbr0e212vjJb1pGFjLS21mKQBDeBcUaZ+2soS4m92VLvelKkYuL3qnht38MEmwcliKbp6ERWjeaZKC/ZvnXadW02fTX4NpU5UgK9mS1QF5ArNe9jO/maUUxZmWKLdf4Ao6zS51k26jd5u8X4sloKcP9ZXMuful1f6eAls/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(31686004)(2906002)(38100700002)(5660300002)(4744005)(86362001)(7416002)(8676002)(8936002)(36756003)(4326008)(41300700001)(53546011)(478600001)(6916009)(66556008)(31696002)(6506007)(316002)(66946007)(2616005)(66476007)(6512007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1MvVjlqdXIxWUhvUzhMVE9rUWdrWDR0bWwxVDJJQThMRUI2d2Zaa1hSK1pu?=
 =?utf-8?B?dWR3bXVZRU5mVkQvN1gvazZJN2Z0cG9Hck1tc1RiMXdvNnczbVVMd1FHamF5?=
 =?utf-8?B?dEdaL3JFbS9yQUxUT2N4UVdsYk03TTM1U01DTkkwVnpZWWMybDhxYmIvM3hu?=
 =?utf-8?B?OFFnRld0Sk5hL1Q2NzNxZExTM2oycS9RRFJ6THVyamw1Vm9ZYVVIOHJUMktW?=
 =?utf-8?B?MjdDNFNxay8vWXlWNzNyaUJkb3h1UlJ5RUtYYVhLYjBaM0RoTEgzUjdjTTli?=
 =?utf-8?B?R0E5aEVuSVFVVUVHTHRnNG5tWkwvVzJxZ2xORjc0bm4zUWppKzZxbDNqbjVL?=
 =?utf-8?B?OVhGdTBTZXR1U04yem50TC81cFZESXY2SWhsRFNsaFhhekU3MkxaRkQxMjNj?=
 =?utf-8?B?SndKVjFVYlYvMzZmUFN3M2Nub1hnQm4rTFdqYkU5OG5HUnNhQU1YTXN5Qlg5?=
 =?utf-8?B?QVNRVkR4VGdYMytoa1NYZzJxdm1YaGFWTy9DNGV3WEdmdnlLYjNGdnRyemNW?=
 =?utf-8?B?OU9wcUVDejN0WDBZbTNaVWltMnVrcU5wL1JlalErbHhsZ0VyVDNvSDBkNGJ1?=
 =?utf-8?B?RzVzaklwbWJoT3VKazRBbGJES1QrblJuRVd1K1NuUDRXTWZzVENrWHUxbnVw?=
 =?utf-8?B?RllKelRXWGFmanJZNFordG5XUlJUdGNHR0JSODYxenEyRndYL1IwU2svbXVR?=
 =?utf-8?B?dExkeFdob1RFQ3dWeFlLek5TYXAxVGcvRDkramxnN1ZQWWFrQUlQaHYvallG?=
 =?utf-8?B?em4ybThPTzc0YXovTmdKemN0OVFSS1pWVFQ4NWVGYmVlM1AvcjYzL09lM21h?=
 =?utf-8?B?cE84RmdBZXZGSzRSOVByUWV0cTdNdFBGblovYWpCUXVHTDB1c2FVaVh1Y0F4?=
 =?utf-8?B?a2NzQTRzN2M3RlUvNlFRenc1TzY5YW15L3pUTmpHTXlrL2QvOWZ3ZDlSRE1O?=
 =?utf-8?B?OG00YmN4SmEwS1JSOENIOHlzOER5Q09vcngzTzBhNzk2ZUdwcnZuL1d3eFor?=
 =?utf-8?B?THp1M3RZTmc5WFFKTC9xanlhNFZlZTZZTXlPZ1hxMitTR2dxRVY0L3hIRVlR?=
 =?utf-8?B?QVU5S0JjRFM3blZ4THlaQ083SjBzTEt6TEhVcGRuNkpDNnpyNTc1Z0tsVEhk?=
 =?utf-8?B?Q2dMTXZUU21vdXRUcmRWVkFWZnJKQ0FaT0ErczQzK2VXT0htNlJEQVVMR2RD?=
 =?utf-8?B?NnB0U2RFNjZjcUdyYnF4eHRMc2Y3R1BocXVTZ2RTRWJzdGtpU2M1U3lFV2Rv?=
 =?utf-8?B?TVdtSm5WSzVpRTlNcElLcnMrQ3l6NlZ3NkRCcXdmWVBnSFUwVkh3UHF1T1Yy?=
 =?utf-8?B?MTMrTHE0bkFPM04zSHMzc0Y1cnNUeE54L1IzWmREandnTFcxK2ZXcUwvVVc3?=
 =?utf-8?B?Z2JJV29XMmsyUlVMQWRvQmc4cG9Eak9PVStVVTNTdGVVWlVsWmo0VlVKTDE0?=
 =?utf-8?B?NkxXSVhObVo4a2F5dFVlblBvK3R1eDl1Wk9wOWJQK1lNejhmTEc5TkE1NFVm?=
 =?utf-8?B?ZHRuNE5VaEJuc1ZtaU0xQTM4dml6TGw1L0gxL1oraFBJSDNLUGpuUTJCS3hF?=
 =?utf-8?B?dnFpcGhDYytmY0lZR05kU0RmM01iMVgxR3RiWXU5dmJWYzVudnRidjFWbm0x?=
 =?utf-8?B?SVQvWFA3cE5xMXFMRWd4SVU0ekI0VHBYQndDVTMxNXMxUkZKb1RXZ2Z0QVRw?=
 =?utf-8?B?TEx1ekE0TWFmUVNIRkV2UlZiQXV2aFVwWHp1clhBR211WWdiYnFNSFgvdno3?=
 =?utf-8?B?TzRuNnhYYnB2VUVXNytGajkrdS8rSjFCcEFiTXY1T3NSVWJodlNGVzBLTFhq?=
 =?utf-8?B?R1ZyZlpBWWpaUTNXbUhRWCtESmZLRXJ1OFB0RnVHeHNTcWdYQzZ4M2Q1YXEv?=
 =?utf-8?B?cnFRKzhoTDZOSSs4QWczZFVDNm16R1oxcjV4VjBLaWVnOVVYZ3IvTWJsV2Vs?=
 =?utf-8?B?RnBUSS8wOWlyb1RqazFSOGYxbE83cUZabVljZ1VZNjdybFFWc1Y4TXVIaTlW?=
 =?utf-8?B?TmZlalZjcDlyNlVTaEQ5b2I2UXRCYjIvN2Q4NGs4MVo2YlhuR1RGemdNMnJk?=
 =?utf-8?B?N1VqM2MyUEI5Nkt0WTRrcDdDYnJuYWFtc1d2eStGV0F2Q3haL2lsM2I0cGlG?=
 =?utf-8?Q?DCzyZgwyXCLWEy5boIY2lQ1vc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6508f617-193b-4062-70a5-08dbd95c11bf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:22:46.2439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sg4eAoaXcNoect9NaHjZo95s/3IsRgzYUZk9ePMvlp829uzOJJ+Uq8ehjN6wUgoDDG8UBHxFDkdant9PaOPWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8184

On 27.10.2023 15:34, Nicola Vetrini wrote:
> The various definitions of macro CNT (and the related BUILD_BUG_ON)
> can be rewritten using ISOLATE_LOW_BIT, encapsulating a violation of
> MISRA C:2012 Rule 10.1.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



