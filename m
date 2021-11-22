Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EBE458C01
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228721.395828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp692-0006ZS-LE; Mon, 22 Nov 2021 10:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228721.395828; Mon, 22 Nov 2021 10:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp692-0006Wo-I2; Mon, 22 Nov 2021 10:01:52 +0000
Received: by outflank-mailman (input) for mailman id 228721;
 Mon, 22 Nov 2021 10:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp690-0006Wc-Re
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:01:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b7ce6a-4b7b-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 11:01:49 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-U-G0LGWpM2m6bgRj7Kwmag-1; Mon, 22 Nov 2021 11:01:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 10:01:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:01:46 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS9PR0301CA0032.eurprd03.prod.outlook.com (2603:10a6:20b:469::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Mon, 22 Nov 2021 10:01:45 +0000
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
X-Inumbo-ID: 35b7ce6a-4b7b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637575309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5WpBCEohQbPxxyYGbSVptHk8uzl3xXdjzUWdcobwFA=;
	b=QIv14VivJDbibUudSUqE9KufsQ1gnAj59781OC8CeuSy5WGB1cJm53LCPh+vTJmr30RfrP
	De327cqCQY+uEBuRW+niXJFeQVuOGxH+lF0L1jKSF2z7JfrotocZGvJImQCqlS9j9aFgyL
	kcX0/iUffemdJe4k5QvRiUV7WS9N4Qg=
X-MC-Unique: U-G0LGWpM2m6bgRj7Kwmag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehiu9dDRlxZFkfWRzkyWXAvjxet6rNInsdWDorXPlL2osBrPzPfXXbD1LOiwfQiDZGJ2rr2tsqIvL2hHMmd6CR9TiLw3Efx0mPlOF79gDiYQdLbGSzb8271bIOXxmeVAQIbUagpIC0pyP9m8/XpA5Jrowl7IhJI1m3n0T9ioc9+oKQN2nyFJ4zWRByuRt1S3XGj3BWi3BJyNEHQ4B3QDXCZTD84b0/wzZv2MZKn67G7PZfenGplkGExwzFO98VDj506ehxWT6jUy8JCnezBTLSwx6hy8rqPfWSIXpUwe58nb0k6sI9Oi3ikucdEtxgQLcIJfZnpBq0v9it3+RmulXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5WpBCEohQbPxxyYGbSVptHk8uzl3xXdjzUWdcobwFA=;
 b=CYuu6kpPr1Fg5ZRctACt35U3nJKzDeA349KDksdIuBzBArMWfvDwj5cv+vt+Z7SBqiljmdFZYYfTXDEF5sLgUAxrqEVB0t+OtoO3AIZcgTw1PNxJUrPWc7/VSb/giMD6slY5Xjl2zq+QC8El0zTPxV1NJ57UmT1JZiIymp6glAtcDD45lCGQhZPH/CXsE+DbDwEqZEXkELgkgXQEn9mw9p6P5UUiyB28MXgVE8S1UfCaYABvRLE6Ek+7HB/2ZbfG07mSh6oNUPQ9wgGSg58SrdhY0MwEor+hMvPbO3FOkhR7NnqEZXYmoinD/64FDWoORUUdappNtHKl7LgySiVhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a706149-aa70-5aa7-0611-2ab458921051@suse.com>
Date: Mon, 22 Nov 2021 11:01:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 1/4] xen: add a domain unique id to each domain
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210914123600.1626-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb6d0705-22c4-4342-1edd-08d9ad9f17a6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB647951F16395762F5C6361A3B39F9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rU+V5S6bQq0wsyrsqZm1zacGAJ/IReWa3ZVFPrPyaZ6ZV0MyOXder2skWfGjdkMPqTQljwVTDz4huD4XzCRMBJGU4LVT25QqljeOZiet9SANvgFkCfL31Sa/IdFEEULsyCm0/I27MQkoyq/Sb0eaf7BqSSxo1XfQtNlBkNjqOHx5u7vnjjURcTwsmpAJyJUBo4QqufScpi0SIaccFbWXImIm90Q6dqPi6asjdhcgUWlh0lSGMzHR80lmyWJyUSDHI58hv2bROwdmydPY0JNhYvhq+5EGiVdOArdHh2IzrHE4gs93ThE8TuzAHLiAN9w9gCqi3aDoxq7PlagEQ/ZirG6OtmGgjbBQMOcd9W6QAkJThW7bLHuO+zp0+R3t8aj6FUsCwlTjeT9e2/AdrmOEe1IkU284ejsSHEk06p8asJGTihftd4+V2PYAM3bnED03Y9UizNzhAPSCffoOuyfHbyDjCTuZ8rfU6JYMY8/l+YTOxG5ivguw/LbV86baED4H5fl62XlDiSFjbxB3AIl8lH878pEAQwroF7dLxGxWmLWITjRIwmAGEAEsBGCsDpSNFSU97Rkls4miOUmUUqcFRAoovou8nIsUZH+V0LZe+ovkZFUOdwr4B2xpHRGRx0z7zMYQBxUnrU11oleBTWqhqdjP/cflTiw0O/qUsMAdJVNJF3RoNJoGk33ZBana58kvZ2EKaV3pqh515MjXQzxON9M5OJLFfCS557KMR+VY25o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8676002)(83380400001)(31686004)(186003)(86362001)(508600001)(6862004)(66476007)(66946007)(6486002)(66556008)(31696002)(2616005)(6636002)(8936002)(316002)(54906003)(2906002)(53546011)(4744005)(4326008)(37006003)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3dTTFZSSG8zblVSWjRVa1UvcUt6UW9jNWJNbGxaKzNRYWwweHhmYTJGTEls?=
 =?utf-8?B?NFk3SFJPL29WM2o1Nno4OTVUV3liOFRlM2VVUDRKdjUxL04vM0wwSFV1QTU4?=
 =?utf-8?B?bFB0eVNOTkpJNzJOdjZwNHJ0a1dBRkIvclAwK2I3bm5BNlYwc2xCQWtRTkVF?=
 =?utf-8?B?cGJpOXZFNkR4SjBuaERsRDlIOFFWblljb2kzcm0vRk90TlVrclVoMVVnd1hw?=
 =?utf-8?B?M1Z0OWNlVHFQVEZHVW1YSHVBVU5FUmZXOHU3ZWd0VlhuNGJuemZweFA3Z3hJ?=
 =?utf-8?B?UWMreHFKeldaRFpzbkFSSWV3Ky9WU1UvVjRTaEJHd0dTWmFPZkZKUHU0VmJq?=
 =?utf-8?B?YlpaNXFTbEFXT29QQWhIS3g3S1dLY0s3ZHhuRmNqL3N1MmlRcW9lbXFWemFj?=
 =?utf-8?B?b25yOHRpQXpwQzcrYU1MN0NQZmdtTS8zWllJZDRBYkY3dWx0Ym9EVEdXcjdy?=
 =?utf-8?B?S1FWOWROZEJvSkRKZE9nbmRYcFduUEUrRmhZdWkwSFE1WHVvaW9vTG9yUklk?=
 =?utf-8?B?TEMwWWVibFA5Q0pqT3dtNlRWd3VUaWR2Y1BpWVhjTG0zbGxKQjRTcFZSRWRZ?=
 =?utf-8?B?ZjUrRFczMHZXaW9RNysrT2I5enBxb0pYaVY5TmRmNGdqNVpJdDdyQVI3N0hU?=
 =?utf-8?B?NS81ajR5TlYzZlZEVXUvL3ZxWlNHblFLVmdMZzFtUnBmYjIwYVRERGhTVEg4?=
 =?utf-8?B?dU5hL0ErSmo2aGNiVitWSGdwQ1pUTHJOQWhzRHJCMkVhNUpSOHJ4Wk1GQUd1?=
 =?utf-8?B?aGFBdW16MUovaEljY0ZWNkduK2Nld1A3MkY3M2dnd2FESmhvTWdvWFNUMks2?=
 =?utf-8?B?YW9ralNnNk4rTDhVZVBPSkpLN0lMMGtTRjdVeWl4MnlJVnlVQUxqSnJxTUxm?=
 =?utf-8?B?cDNPRElGRWs4UjZsREVKcTVRQ1lhL3ZvK0hoazA3NDFTS0M3SGhHTndzdkhu?=
 =?utf-8?B?cXJCYklLVFgyeDQ0clRZTWJ3RVAyWWswbXBRTzBuQnNLSzg0NnlMMjQ0a2wz?=
 =?utf-8?B?eGhTUHMyYXJtalBJMGxUVW1VOU1wQmllQlFLRUpjSytFZ2RnV0cyYm1ZakxD?=
 =?utf-8?B?UGtCOVZuWWxVR1V4bjBtWUtJUTJPQjJkVEVMR0pZTitUQ1NPZktmeWpEeG10?=
 =?utf-8?B?ZWRCamJZR25PV1diSUZ2WldKcXJGM09yOFRjQk1ib01hcnQwakIvaGx0b292?=
 =?utf-8?B?WHB3Mnc1c3BZWk9KU1JOa2VtZXZyQXJLWnJoOXBvMVIyN01qK25XdzkwMWV3?=
 =?utf-8?B?T0xSZHArdFFZMkplZDNwT3NSb1BTcDhvajNZOS9RcFJjSG00WnVqdzRIVHZU?=
 =?utf-8?B?cHhpTWJVNHhxRVRaM0dOeGVKY0JoTzc3Sk9JNGxxR2NSd2VmVE9CU29HTUhD?=
 =?utf-8?B?dS9MdHJzSVVyRU9HQ1phUWN5bUozZGhPcGoyVGt5ZTgrbVl4WTlna1NxUW9D?=
 =?utf-8?B?SVk2b2FhMDVkQjVXLzIrNHZSblRUNTZCYUI3ZnMvSzZ0TzZSV0o2WEhLOTBI?=
 =?utf-8?B?K3lnWWluSURmZXRtTXBjVm1mZHYxbmxqM1Jia0FzTE5lck1MeXRxLzkzdSs3?=
 =?utf-8?B?MWpMdm81dmdieTB6TWZXZm5mSkYwQjdXTFByYkF5L1gvNnY4RStzbER5b2ln?=
 =?utf-8?B?OGZQUUQ1MjZid2ZzUEJvamY0NnNLMnA3UVBhMGt2eVpSWS83dWhHdXZRb1Ar?=
 =?utf-8?B?Qi91bXhCMEdaNHJEVGtidEU5NW0vUXZuWnlLaVVXZE5BanhGWGpidUZ4N0NC?=
 =?utf-8?B?dDFmMlhmczNFQlBsSCtia3ZobkcrRGU2bFdrb1ZZZnl6eWJHYWl0REVPSUcy?=
 =?utf-8?B?VU5TbEN3WlJmS0YvYmplVytwRGpQTlorNE5qT2wwdXBZVXJJUTM0anZkY013?=
 =?utf-8?B?aXNXZ1lQdEtZUEhhU3lOOVRvMHNpTEZ1eW82c3BpSFZTa2xPbXVHN2EwTy83?=
 =?utf-8?B?b0o0OUVSWi91YURpWlBSNkpBNXRZTTdWVnZUQ3VRZ09DdWVJemgvN3JFaEtu?=
 =?utf-8?B?NnJJTFd5dHNySGFNR1h0aUowMTNTK25yRFo2KzFDWnVGV1VkeURPMTMyWDh4?=
 =?utf-8?B?c3FXdDFqUUY2RzdBa2dkM3NhRTcrUnJCU3p6Q2oza1FGTTJuaHg1TzRRUW1O?=
 =?utf-8?B?RlFJTWtVRzVubW1UdlljMHYyeUpTNkVmZVd3YjZESFowbm5HQ3ZkRW85ajZv?=
 =?utf-8?B?Unpkb1JUeVkrME01SDJ0UTZzSnR2aDZRb0JYVGlEdllTMzBxTTdQMlhVVzVO?=
 =?utf-8?Q?Oc1eUNUBgC6jKmyCR6T9iwaDaXUYK7kIptM/IPLeXM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6d0705-22c4-4342-1edd-08d9ad9f17a6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:01:45.9153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5O+h/cHyHLzjxCuAt3osAs67RfFpiA1DOy3fm7eJNf4uqVraAXlxR+FBYJSc6gj9uamg1/3mygHPX1v/fWLDLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 14.09.2021 14:35, Juergen Gross wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -84,6 +84,9 @@ vcpu_info_t dummy_vcpu_info;
>  
>  bool __read_mostly vmtrace_available;
>  
> +/* Unique domain identifier, protected by domctl lock. */
> +static uint64_t unique_id;

Unless a reason was given for this to live here, I think it wants to move ...

> @@ -473,6 +476,18 @@ static void _domain_destroy(struct domain *d)
>      free_domain_struct(d);
>  }
>  
> +static uint64_t get_unique_id(void)
> +{

... here. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


