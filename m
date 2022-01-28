Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E549F805
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 12:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261953.453872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPDf-0001ny-54; Fri, 28 Jan 2022 11:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261953.453872; Fri, 28 Jan 2022 11:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPDf-0001l3-1E; Fri, 28 Jan 2022 11:15:07 +0000
Received: by outflank-mailman (input) for mailman id 261953;
 Fri, 28 Jan 2022 11:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDPDd-0001kv-8V
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 11:15:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7fa558-802b-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 12:15:04 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-mmcoWYxFOjWWqjNrdkbFzA-1; Fri, 28 Jan 2022 12:15:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 11:15:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 11:15:00 +0000
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
X-Inumbo-ID: 8a7fa558-802b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643368503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmIHgUr8HiWv1bY0ay18YAn1MnrOKIQ/iHnjgU61aDA=;
	b=YjxQeTKn/Q6IiGRig9a7ZZOsb6Ox/rBI5HxDYMzu+GVjDthcy/MYxKVTsOK5n7i2AJDWim
	xK8Ac7Euao6Ah+V3EW8sLcBC9WaYTp0EiFL0RA+rZuOyV0Fw7NGIncLUkC1HqjLvbHEKf1
	7IPeih0uMMlZsdSDNHppK+fUqIBytpM=
X-MC-Unique: mmcoWYxFOjWWqjNrdkbFzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS0J+I7X6xntXtIlC3GVM4Yu4k4lvcFNtD4Hr/CFGT0m4eJSO7MPWNRID8B1H5gywCkmFwQ67LPcQEHlu6HZDQjUbwqFzgBiXsBWxtM0LDGnTV1KWxXW/JhZ1AEsbIjEH41l+aNMxa2TNWN0E2Ej8QGVCRRIv6UknTmgRZ0nXZN/KoJGN3zxDC9rjZnGtFSjWJfTUV4D3amshC2qX+IH0WF2GF/yh+QKEzMozmerCKxX7CuOrO5oJa+fRduMgc0o5MkXhyqXs228IUnNzTjLCif0y+y7FFF8vVpQr1qATS4ohSop5ZPR1khEjk+IkNb/XkWDdPbnyKBPqS/Vusa9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmIHgUr8HiWv1bY0ay18YAn1MnrOKIQ/iHnjgU61aDA=;
 b=C9fC6lSKlkHRl+I/PbtfbVo5VyLaBI0ykGFBLtuBuNEbq9k0BL5gQ8fSgVjXueE91daCOn4B65CqMqRruQsLN9uCQkP3KwckP2mKqYZjShsVdBkJEXxNe3QnnggnGmJrHD2Y9L0DpDUsBN4dd/Abe68/+LqCx3rvCT1oFkZiNja9Wp4rkL0i+piOn3r0U3m0YeBqb4W+Vye/9x3DcRml+vKcA+rKwxnxXyhgHfT02aHFYLmKdCRo9eATdht95WvGBe8/5ruSFJW2Zbdgc6J9qL9Nx7I+NDQtHTUmvQIQm/28YVYG7nkD+vBpHRgKG/DKucc4is3Zom6qjr15HBESQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d729f897-6319-e82d-f953-c8411fde1e07@suse.com>
Date: Fri, 28 Jan 2022 12:14:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 03/30] build: fix exported variable name
 CFLAGS_stack_boundary
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb568cc2-a05e-4bd9-23ef-08d9e24f6c67
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB51463F5764E3CE65AF47A872B3229@DB7PR04MB5146.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ISgl40oUt5r28hVB7lpLaZnRd8WAxXAenl4JkxGGWsZsxRCUXzMn3PkyzXm48/TmkffQePF1g49q2hB9YK2UZ2nOjZNWZgEhvAWvBXOQcdvV2N6K04X+u4p0f3Kx6KFKnFbZ0/5wAoA4HrEk8jePIpRw5RO9YMh3fm2uIaN9YLNlFa0prKi1wOOpRGZPleRyv9ntACtdKvDhTlzy/d+uBXfjE0C2vmi8secdYRe6hpPAgjUa/Vcf9EaAy7EcbwK9dbuPHoPhqIXq1WW3KdmIV5jq22LXsAekokxrz9uwpPnUapYOUnX3PsGvxl9p64Xxx5mjILgPvU06gHFrmo3kqUY8WwrU8XAaIqF3pByF6fNJzNO50+IoZKcITLJukE+SNyXFfKa/m8AMmJvV7cVCl+zknRNwI+1DziWIr6Y9sM5WhGiSfIuq1zQbeTIZ1iy1fhuOPkXWCyVtCMwo3fWx9TPqZJ1kpgUSeqFr811yC+M4hRcp2fEw/ZuSeFkZpABI+XBi/0BfoJfih37KZQ+GJ7XfhZCuODiGPdKvSqubg81PXsYClKRXcCENGfp7ym+IE9B+2WKPT+BM1M55fonRdkplEO+DVC4bAJYTKyfRMG4qXGbSaxhb47XSzOxbe0vlExLIDeOaN2nB+tU7iHAyKEBfLIF2llmbCaGkwDpg5yqxqk3ut3Hlqd8W/aRc37BOAmNlU8jHZ8anh330reITxpHMEdq6drguT4DvoKJncA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(53546011)(26005)(6506007)(2906002)(186003)(66476007)(38100700002)(66556008)(6512007)(2616005)(66946007)(6916009)(31696002)(4326008)(8936002)(5660300002)(31686004)(316002)(86362001)(508600001)(6486002)(54906003)(36756003)(8676002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElFSVRRRU1keTBWdGY2MmlhQmlVTW1RSWhIa29qVzdDR1lJeXZXbHRISFZQ?=
 =?utf-8?B?VlNiRU9PZkNrU3JQYWwxcmhVY0cwS3IyOHVWOUl6UjZ1RXdFRTMwcE8weHY2?=
 =?utf-8?B?L01YRjRyTUszSWMwM3hxczZwa2l3TnROaFhMdnF6VXFHWWg2U1VkYVE3VU4y?=
 =?utf-8?B?bG5VUGVxY3BjajZHaktvM3dkYVArTmhoRjFmTnZDcG03ei9ZZWpPZldhbmJj?=
 =?utf-8?B?a2h3OE01YzBzU3NzQlhTVnBhdlBVVE10bEgyREpQWllLK2M5RktnTkxNRDhr?=
 =?utf-8?B?V01EeldNL3FIVWlVVTBOS0dVaE1IZXc4ZWl5SElxdnU3ZmxrZTNXOW9yRUUr?=
 =?utf-8?B?c21QUy82bEV0ZkdYOTdsNlhVd2Vjd2xLZVJPZ3lGVjByNHVBMXRuU2JXSTFW?=
 =?utf-8?B?Uzg0VVRudWszUzJWMEZ0cTJ1MFZQSDBhRnJMeG1LRGJYVStzM3RIWmpoWWcw?=
 =?utf-8?B?ZVBkcVp0cUZOWjhLRTJDOFIzZEFuK1daUkJMblNSdTgyL2VOdjdoSkV1aGsy?=
 =?utf-8?B?TVZRcTFhWmprRm1yOTJxVzRyK0NXdVFiL3hEb250WWgzMVBzdVhxdnhtaHg2?=
 =?utf-8?B?VHE3QXAzSXRBS3NVcTA4RkUvZDVKbWJKdW5pYmVMV2tsRHFjdkdNM05sbVBx?=
 =?utf-8?B?Ym1XemorQ2RYRitId1dkNkRBUWJMMlVtenRMdlU2MW1OWHcxZFlGdTVpVTk1?=
 =?utf-8?B?WHRlZlM2RElwcmpVQ25jSlhvZzdYU2pKeVUvYWVxVlRzRjI2aUlVYnZZVHBW?=
 =?utf-8?B?M1VjUHdIUi9qY3VLZmx3RXpwSlFzOGRQUXVUdUYrVjNJOFV5QUpkYkFjR1Zu?=
 =?utf-8?B?WHRVOE9sc09HeWc0MkRFemtBbllXYk92ZnJ6OTdRUExBTnJjQUpKcUx5cmU2?=
 =?utf-8?B?blVEYVVPb2liMjE2emlnUHpKVWJ6ZU5tZHdmZ1dQajN0Vjl1SjBSZktITGdh?=
 =?utf-8?B?Vi9QV1gyZ1Y4dFlFd0xYZkljYUQ4U29va1c1NkVSMGZ2SXdKb3ZpV3lEUFNs?=
 =?utf-8?B?eXUrWnJOWGx3Q1ZKdkd5NS95WlRuWHFnNm5KQ3JwOHpOdGg4bWR5MFhML09u?=
 =?utf-8?B?bGZqSTE4TUFCcVdpWFA0ejlXQkQ4Yk1jNXNTL2JNejlIbWpwbnVPUnR0bFQw?=
 =?utf-8?B?bnV1aWVHam41bHlOMEJVNjVUVWUzajBWMGo4WjZ3eTNPRFVETzZQNGJ2UUt1?=
 =?utf-8?B?QkhFcDhvU2hzZnNWT280eXRFVmcybTBONmtlRis2VDAxeFFrbUk3dUVyQUp5?=
 =?utf-8?B?dVpYOTlmU1BwN2Rpd0pnbllJaFBhUE55TWsvYmhDMUEvY0szV2Y0TGZPakhn?=
 =?utf-8?B?czhtNm9UbGdkOW1MSmVaMjRaNnY4KzFnZXpPdE5CWTRLS1FkbXdZRFVNTXVz?=
 =?utf-8?B?QzhYM0YwRWZQbFp1ZkQ4V1VROWE4UW5PV2YyUnRXeitEK0Nyd2x5Z3p3OEJT?=
 =?utf-8?B?OUMxWWhjeVYzV2Y0Mm1janpLWjBMdDZRWWFFeDNENGh2WHdZeStQMUlvcTBl?=
 =?utf-8?B?T1ZXdkFkeFJONGUrZGR2Q093c0c4NTR0VFUyZFU5Zmp0b3dhS0dKSjJ5ZU9J?=
 =?utf-8?B?eER3T1BqTWNrbUNHSzZOVnZsTHFObHQzRlpWNmpDaVlwMXZvVWNiMXd0Wnc3?=
 =?utf-8?B?eVFWT1loK2tPRzZ4Q0pTSkpHSGJYM2xZRlp0OHdnRGx3bE1xVW9WWExNMEVO?=
 =?utf-8?B?dmxlUFg1U1pTK2Vkb285aTJMZGgxOWRkT3djNDdtczdwQVFUd0R1ZUtYcHh3?=
 =?utf-8?B?QmZVYnZZZHVPYnNzU0F5dEhVWDRGcjZuY2tlVmczT3JHa2RPa2hzOEpZU0Jk?=
 =?utf-8?B?ZENYb1BJWVVmaS95cy84NHNMR1dKOGV6YzMwQXZ4VjZ6elNIdHhQZlUyYURV?=
 =?utf-8?B?RWZ6dk5Da2xDZVZPKzVvR3NhMWQ1VVQ5Nm95Qkt6b2pKcTlUVW5PQVhDc1k4?=
 =?utf-8?B?Y25JdUVVNENIcU5leXdVSm9OR0Y5OXI0WE4xUklaNjJ1dW9teG1hU3kzMzNh?=
 =?utf-8?B?emltYkZ4YitEQ3RmUjlwL2pLR3FjSnB5ejl5TUFCZlF1dkZEaFF0elJnWGgz?=
 =?utf-8?B?aTBqMGFRK3pzcU1QVUtMeXVxKzQvamMzRDNHVExzOUFtUjNjb0YraGxSTmk5?=
 =?utf-8?B?QWpDSjRWUUJSK3grQU1ILzVIaGhPMSsyQjUrSjhlNGtTNEkrZG5HNlZyOW83?=
 =?utf-8?Q?CFNubUiuaxquqmGYE9fiTGg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb568cc2-a05e-4bd9-23ef-08d9e24f6c67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:15:00.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joQg+h0ZI3XgwXM/aGCGz0Y9r7k/J1Xrx3G0IoQZq/3gpM3cdfDkjL9JDnLuuUOTLHQh0uO277Wqt+FgPxwGzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5146

On 25.01.2022 12:00, Anthony PERARD wrote:
> Exporting a variable with a dash doesn't work reliably, they may be
> striped from the environment when calling a sub-make or sub-shell.
> 
> CFLAGS-stack-boundary start to be removed from env in patch "build:
> set ALL_OBJS in main Makefile; move prelink.o to main Makefile" when
> running `make "ALL_OBJS=.."` due to the addition of the quote. At
> least in my empirical tests.
> 
> Fixes: 2740d96efd ("xen/build: have the root Makefile generates the CFLAGS")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

While I did commit this, I'm still somewhat confused. How would quoting
of elements on a make command line make a difference to which variables
get exported?

In any event I understand the description that prior to the subsequent
change there's not actually any issue. Hence I'm not going to queue
this for backporting despite the Fixes: tag. Unless of course I'm told
otherwise (with justification).

Jan


