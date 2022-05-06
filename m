Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8851D943
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 15:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323141.544723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmy8P-0003ws-BN; Fri, 06 May 2022 13:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323141.544723; Fri, 06 May 2022 13:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmy8P-0003ue-6y; Fri, 06 May 2022 13:36:41 +0000
Received: by outflank-mailman (input) for mailman id 323141;
 Fri, 06 May 2022 13:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmy8N-0003uX-8e
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 13:36:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dbf0aa4-cd41-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 15:36:37 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-Pi409zZCO7eAyAVCWaaR3g-1; Fri, 06 May 2022 15:36:36 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4244.eurprd04.prod.outlook.com (2603:10a6:208:5d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 13:36:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 13:36:35 +0000
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
X-Inumbo-ID: 8dbf0aa4-cd41-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651844197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TEu/d+isEYnxaYmttcn60/lZx307T302lV5inrNhwjk=;
	b=bSTiN9M99Wjr5WucOmHgxkHwnlBLhRg0BySO7yT7qCjYjcUhlVbKrG8bsaqBYIIhnMT1QL
	xSu1AcNYARoMaIJbIFfS4K8Wc2pCoqCh5htRhRqkMGmZWng5HkzKRG5C3e/fc7ciiD7TeQ
	Eq/jTJHuwN06hcj9bqiJuwpdyW8uJNU=
X-MC-Unique: Pi409zZCO7eAyAVCWaaR3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oV1ZM1mTOSC/lCHQ8DmN40iuIaiULmT3+y3q5LNeDbmCx40VBj97uKRNWzTs3cUAVOgCWapEtppH0sg4FfdlilbPftkg7hzMNU674UaOYrcV4NePbg0r47+X2Ypm8bmvKP8WBt2JlUyD5FRn32uBUEemr/nRFcn+9OQH/BFSdgWrhtRLWOTtqpeuPD5duGEjDOZPHSBf6As5GguZoTqyYVVBAJi5SLK/jEZCObItameVpdXAbHl3lcBZTgIz4UeHWQzEn9SZbaErxk3DecPm38fJ/0YcbkV4I3KyYeqFPPCcdr2dNzW45yreTPT5KjgQolyzn7DMW4bo09PviO0otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEu/d+isEYnxaYmttcn60/lZx307T302lV5inrNhwjk=;
 b=FCHggz/oslih1mC6eB9AguMqJBAmwdlIfIiIOUEsqplyW1P75ikAHQAO4O8gR++Qm0vDaRlJtFd3aIDVOcT+IjkFxhR2AUbqTu4EKCkYcgndxHyoqoVmuSoq0F1CpJhsmKnRkLsb/98vea7JrWuWv0C589nSJOjFulSQ+sRLRUTY+BdVq0DKXbEhSR37M1AG9b65Y0SbLzLp36X1kT5/XrJd4deKvNflibILruwgAMh5JRjafJQ6LQiRwugmQ1IoNXL36B2zg3Wn+WJJxKJYjK7upKvUHRsNrOL3HvwzPDjX2cuT6S4WAmTvFlkhWGMfMLWXSMK3UYLhagSt/NLTAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
Date: Fri, 6 May 2022 15:36:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] build: deal with future GNU ld warnings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0092.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::33) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35fcd030-8403-4ae7-f3e3-08da2f6570a7
X-MS-TrafficTypeDiagnostic: AM0PR04MB4244:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4244E87972602B8A6981FAE7B3C59@AM0PR04MB4244.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kbXGMWJ19SQtxAH8SYWLmoNBWgECrqbtpQWLyoR0b7FO1/3orwTVR8bSjWKyVKvzIPo55E77GQRO2ovl+uM5BGNKoWlZeazqBfum8gsxsGXbpsMZQCUBd/jjmRKfHSeVp8jup446TZDm5agRP4aeM5+vdT9kudjs7fWe/cahZ+XmzY/wNvJ987FXXbmxpb+hxsl2Yb4EW8rX9PXdX5Sgb3lPjaxfzCUqNwnbqDOrObTVI3fei+NUrhSZ/jka0sx4arFuB5pg4ul0gmhcGXekMznkwhPLr0VqZmItlkmwAdVq12KqAUpaLDixt2Mq3pd3hd8YyNxOudVdXK1x7CmWleO0+iz1Sk5PrSfeNgbep2lMzzNV9rbNadLuJqo0Xhc1RZh2HJGKxW3iA8fqbuQvAfhgMbQWKoq8vwjNrRU8kRt93rL2xBn561MC1w7yQ9DGeEWZS0DLjhJ4xiuXt9+WU+GESuR8TYZrWynxzDBvgoaj3LSXL5X6IUIBddfICfy6y+2kugOZnmldt/ju1CBt1jbt2DcXb1nWEMJQjcqI2RBafVRQFyVGyVi6v+8G1peq4HYg02Z3IImW0oDjx0YLIX0KmT41qvZyk28XUShiGSP3tOKbtj0PGz60Oyc8msYdw3nzp7PLn3uV5ItYijmIESvit9sbHNMecTR3j6iLbJ9vNF5Jt0KSZ7JnnHwzecKIo1jDINgwMn6Sv434H09eMT9mXEQShasOxYv0siiWiiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(86362001)(38100700002)(2616005)(83380400001)(31696002)(54906003)(26005)(66476007)(8676002)(4326008)(6916009)(36756003)(66946007)(66556008)(5660300002)(8936002)(6506007)(508600001)(31686004)(186003)(558084003)(2906002)(316002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1BHZzBoUW9kQThGK2xBdFJEVzlXbm1OSDl4ZHU2aUlxZlJuTjl4VHRjYmtK?=
 =?utf-8?B?RTFXWjFONkcwUGZOQzBRVTVlaXFvT3F4THArem5qYkc5VUVpTXVaNXRtWXZQ?=
 =?utf-8?B?QU5mTjFTUnlkSXQrL1BLaDhPNkhLKytOOTlCTSsrZlpINmdKeWZxZStjNEFn?=
 =?utf-8?B?bm51ZmxXNTIrSUoyd3FCUng0ZW1pb1FybS9WS0g0RlhTckVodi91NlVJSnVW?=
 =?utf-8?B?MjNoQzl4d0FvcnVqRXZuS0xSdE4zSit1dDBkWnJsQ0JHL0ptQTFKTXBZelIy?=
 =?utf-8?B?SUYzQVljdmV1TW5PKzVxVVpLK0ppT1RqYnlObTZCRVREYW9UWU5WOFJBeDlO?=
 =?utf-8?B?U3dOZkk1UXVKRW9sL1JVVUtERTIrTDBnTUdIU1RkbHZJL2VOTW1yWllZdWth?=
 =?utf-8?B?Skdsb1JiVWVMS0taU0trV1N6OTdJb1QyM0xISFZpQzI5OVQvdjc1VmNjS3pS?=
 =?utf-8?B?cDM1RjNaTmFqZithakRxSXN1djdkQmlZQVFZSVFTVUtKcko0R3c1dHM5WWdE?=
 =?utf-8?B?UWtRTWJrVXl4ZS9YZ1NCTURXaTFnYlMwSWU5cUVsMjg0dm8yMGo5K2h1OG9L?=
 =?utf-8?B?b1Npd0c5aTJuN0s4ZUtrVmhZMERPTGltZXhYdkVuZitiQkdRVThOUXliWFZj?=
 =?utf-8?B?U1RBS0RoVmp0aWErdVIydzRLUVJCc1JUU3lYRXowYm9OVlJhSThNS2JtTXhv?=
 =?utf-8?B?U1lKemRKMkJ4YjlLUXhaV0FNaFhBd1VZTWdoSDd1aEZzdmdMM1NReStrSTZo?=
 =?utf-8?B?QkFUdVVFd2hRYU1lb3JIc0ZLSUh3Z1VDMVhrNXZRdUM5MkpHNnZOaUgzWWxx?=
 =?utf-8?B?LzczOFBjYjg1a09taHJDaDAxcmZQY3NZdUN6YlQxR0NPZXE0SXZDUVpMeGVj?=
 =?utf-8?B?ekhYVFN0bElDTGZFeW9uVVp0TkovYkVLRkk2bm1PSkszL25hTmw3ZnprWXVv?=
 =?utf-8?B?UEV4Z0dZOTZtTGdCbjNKNC9sUHQwZHJpbGR0dVViRHgzbW5iY3RlbVhXMWYw?=
 =?utf-8?B?TWM5SzkveFFFcUUvOUpkNkl0VkJQaitmTFZaWlY1Mk96Y3BpZk5lQVN1cXZp?=
 =?utf-8?B?bHRrZzZhWDhob2sxeFBmeHF1ODkxMTgzeUVvS01sdEtHajIwM09vbG5ZQW1w?=
 =?utf-8?B?R2lRamxPOXBLaWsxdHJZdnp6SmluKzhqUXEzU1Vkd0c4cGtwWjh0ZHZBQ0Ex?=
 =?utf-8?B?VzQzVXRFQVZkUitIQUlURkdHKy80K0QxUmloS2JQKytYdlVXa2EwRjdVTUlP?=
 =?utf-8?B?WlpDNVhSVXc5czI3dTdBM1JmVFdhZG1meGpqTUNtV3hITXJiZWtnV3N0Ty9W?=
 =?utf-8?B?UW5BWkp5VjFVemkzNy9RVGQzNlFSY0s5UVYwY1FuQ3h2TGdqRldBU1MyUDJx?=
 =?utf-8?B?T3JxQmdaQ25tSUVteDZKdTdqUm55TUhpUnIwRktPdnJpcHVzVm5oOXJTMXli?=
 =?utf-8?B?VFJDNzVjSDR1OHZDRnV0dXRaT05zZmxqWXRFSmo0ajl4RnEzcTQyb3N0cFNa?=
 =?utf-8?B?MEtvYWdaKzc1RWIraVNyejRXS0JlL1dBdnhuYi9wd1hzeDFXeHZiWUtLV1Zz?=
 =?utf-8?B?dVNFem0ySEJvN1ZoVzhrWjRERlY4MFBwek52MklGWUtham9yMG5NSmRTQ2FU?=
 =?utf-8?B?KzExM3dDbDBNSU1KZktCbUZwQmlkeWNqNUpwU0NiUThZOFRZdkVxdE1tZXVR?=
 =?utf-8?B?UDlrR1F4aWtEWVhISGg2VWxEdzF1NjU1ZjRtVDhvZFVKbFZ3M3FyeTkwREJ5?=
 =?utf-8?B?VDNlKzRoNGRPaVpPSkZJRTJZcDBIUkN2Ly96dzFFNjcxS0doMWhmN3BFbGFY?=
 =?utf-8?B?ZzFCTnFKcnhpR3VUR0RyNjdlZmdGMzJYVmxKV2QwSFd1eXNpU3M0RU12U1Jj?=
 =?utf-8?B?b2c5QWFmMGk1cnpNcmpjMFpqM3Q1MkVEUU9YWXN2T0d1Nk5tL1FmMnk5Tm9i?=
 =?utf-8?B?WTBIM3o0UkYvR2JrdFdEOU85S3VZNWVONkZraTlKaEJjbHAyZTEvb0JYSXVx?=
 =?utf-8?B?U0laMVJtZDZoc1N3dGx6QmhoTVdoZDVqTjNIeCtpNkdGT2ZLWkJvbkRxMUls?=
 =?utf-8?B?azAvam5oaTM0cURoL2t3Mll2VkZTOXVlMUlZaktDakRsSWNya2dkektzc0RV?=
 =?utf-8?B?N2E0TGZ0aWpwSTVST2dKRklwbzd3QXlSZmNWSjV6U1d0SVZhN0NrK0VqZnZW?=
 =?utf-8?B?SlFGajBLMmR1WXRiM0FDMGplKytvM3AzakVhMm1jYTFYSWlzSVJNYlNGUzBJ?=
 =?utf-8?B?ZFV3L2psaFZFZ1FGYzNlbHFxSlZKait3SzZHdDJ1UkNBenhnTHNiRmdOS3Vo?=
 =?utf-8?B?Ny9OeFM1OG8vWDVtc0NNRFNBTmFJeTk5czZ5M3A2R1poWnRqeGpkQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fcd030-8403-4ae7-f3e3-08da2f6570a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:36:35.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvmNeN7CdggRdrnGJhxoB2Rqqf9HUIYYOFzBdNRWGWNHxzGBI0MrHjZknPIZVL1BFv6sohTQlEF5cDc/k6eFsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4244

1: suppress future GNU ld warning about RWX load segments
2: silence future GNU ld warning about executable stacks

Jan


