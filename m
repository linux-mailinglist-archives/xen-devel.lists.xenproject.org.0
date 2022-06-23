Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B6557C5E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354956.582347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MR7-0005HK-TG; Thu, 23 Jun 2022 12:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354956.582347; Thu, 23 Jun 2022 12:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MR7-0005EH-PD; Thu, 23 Jun 2022 12:59:53 +0000
Received: by outflank-mailman (input) for mailman id 354956;
 Thu, 23 Jun 2022 12:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4MR6-0005E7-0M
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:59:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dfd3c27-f2f4-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 14:59:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7960.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 12:59:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 12:59:48 +0000
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
X-Inumbo-ID: 5dfd3c27-f2f4-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbyf2GuDZRxGRd+8w2R9dygAN8hdbMxcKaUGbvca9aD6UttF18+Y/VsH3z0aSg9/wcRmCM2heIVtrkao2JEXxBJBDgFlcc04NHHa0ZKjBYTMXwZvPbjXmryy8N/kPNHLRsHcW4DtEpIDxUwcvWfrn6w5ehtwszqhNgED+zc2wVxEZWHqbQRx5B1rPT+JW5H0rCFTgvpZKABBpxX7nH7K1JpZ24xFoKYufdzHqR1KEFe15AqaNOx4QU+68dScawGytUCKCTePGbH+02hBMknP3syFValifD7AqgnH75WFS2zhJOmNuXX+o/9ibl1hzQEN26VFhYRi4sUvrhJSsn+QJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IuVPsVWl/8sRCb1phdqUlF63oQpQLnaNXYBxHmCukA=;
 b=iTQyrrRUEAsUO1/gBlVY1Tj0lCvCYpKiD1R6tR383uL06ekRKV+HifzH5bLPs/5nReNh0g/gI1zA2ofYG/4U1llT9yxsDIu/IPhllTfV1yQkhqYKT7ICGfqIzrhGdA1gYwjBVRc4GL0Ze1zTe7faI6brH2blBX3xEc5SDQ8mj0AV7kHRrcfeCyTqGUPV9aqjUl4uxhIuz6GrTo6NaMq/ZG3ZYzdxPDooFONYfXRswt8nyAHt3nL7J0suvyh8GVlFVckVzoNlBMvPpe+4p7eDwZdDOBlYLg0z0bSRIk3GS+96MWS2K3Ea9LGkON2kjpTj9Gj3sDEo53rN7ev1cGWSuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IuVPsVWl/8sRCb1phdqUlF63oQpQLnaNXYBxHmCukA=;
 b=hZXyp0uxw3hxgsXhLMz+Ad/aKtf26Y7RRZpmyFe6m0xU45HYAaGE9ZKtsQQPlPxY5xl7+ITKHq9jZ5OZM42EEKDB8yJqkh/VnqOGkoYYYGHAGdzydORrfMJckNZ+hDkMhumc+C9WqF3N7CDAOXtm4XxUCsoAHDW20/Irna/oeBb5vVmp+17baQ3HI9sDyv3R1V2qoSiuxAFb7SHvSNU1QohNKt0NpX5/KVIiytK3cUPFnk7VXJcDBZpJ98SpUrxyYgxZuVev1kmBIJgZQ55+pP1qr8VUAyW2LwykBk5hK52uExdNUbIcj48s4cSjz2Y3pW0/nfXw0YeMPOe1U1OJ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0de3b7b-fdb4-716c-227d-5fee024d8fd9@suse.com>
Date: Thu, 23 Jun 2022 14:59:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220623112407.13604-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220623112407.13604-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0057.eurprd06.prod.outlook.com
 (2603:10a6:206::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48ce1317-e7b6-4593-9040-08da551840cd
X-MS-TrafficTypeDiagnostic: AS8PR04MB7960:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7960F9A024091CB7ECD6828CB3B59@AS8PR04MB7960.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9AHMfyNOuY4iWxoWivV1fMcKgozAzfmAzDVBMIQ8ebznpqO/r6d7rWYs/VE9nhaBHuzezghWcsVOySUzRk0/Ke0i9n2NPrcZx4q1b8hLCC+E8GVT+/bxcpjqKpXWlzG5OCEUIgMWNj6g+EXfXhEAbj+WqvI2WWlFg8BgjiqnvddX6gTDw5m87pPxF9dQfrBZ85FrWB4oQqjdujDFW73LSDZQtvzK+1ZTcY+jwX0fnw1DE2F/3KQLcyOkSmfgAWZaMRjVqArWs4auZCZGth0ZvQ4PJVRvhKZtDQ5oKLV/xbkJFlHb1prfHCLMau85XURrQSZiQZNHhn1pujYUF/juBAEPtJjkD85U0HoIPESeGwO7zadv6COA7ruWPIZgsnvNWaDCpPhxBWRpYg8sdWN5DBJtZzoQrrgVnMp/m8NOrXCsXfIDScwPbC1/Gg8RJPr2SWtFGo+UhLYonjjykAPW57ckRQdueIU8EslvVgbC1qNsG/VE72XoPit2cG00Py+w7JffFRXnzCemDohabN1xoyXwaJji8SEIHxvkDfBgaubdkGl9zkdbpCz3a/BRqs6xZxGQvja4zbpIzWf6tKIU+TgXhzlaaHcNqBmaHTw4OVmvrVvDirNbpwQ+pBWp2VPr8Q2Zo6zZ6JLqCRxI5bx4zZreFoCFzHo8roZvYi2GMJubR8JNfQaDJ6XRWZkCrhWy7GPwgRHbrXnr/ItVAD0iEkto5zPj+bc2Ra87zHmFqiGdrykhyjCRFWoXOj2amVXWGwhGepH7SDJ7e8UylQZthGMd0/2yW/M9Hbdp9QRw+Fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(366004)(346002)(396003)(6636002)(53546011)(4744005)(4326008)(6512007)(41300700001)(86362001)(38100700002)(5660300002)(6506007)(31696002)(26005)(2616005)(83380400001)(316002)(2906002)(31686004)(66476007)(8676002)(36756003)(6486002)(8936002)(478600001)(110136005)(66946007)(66556008)(186003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFRXSzRnUU1tL256Qk9EZjh3YlM1NHBBcHRVQTh2eU9NdGxOS1JXU3BtblVM?=
 =?utf-8?B?S3QxendPU1h0M0xGMWxRejBRUjh3aHdVQUVYUndpSnBBVGJJZWFmTmd0K2pR?=
 =?utf-8?B?QUdHVkZuYS9ZTFlReFdmbWo5MjJwRkRUK1pQbHNyVGFrblNxYXlET2lwQ1hC?=
 =?utf-8?B?M3RLWlh1SnpwcmIwelBzOE1MRDV4d2Y4VmIvb1VKNDNwWWJ2THU1am9hTXlm?=
 =?utf-8?B?MktTcGJoSkNMejRJeGI1ZVo2azBJQ1JTb3NmK3ozMGpmN2l1NnYxVEZyeDQ4?=
 =?utf-8?B?ZEtxclJFSkZlcjc1K2xJSXVLVTVzdEJoOGxVa09IZUd5UjhXd2JqUGxMOWJh?=
 =?utf-8?B?K1NiTmxnRjhkSGdxRTMyQSthQUZIaGQzVGZoL0dHaEpIc0lhb1NzaUQremVX?=
 =?utf-8?B?TXcxaTZXOEdRMHFLQmtvU3BuU3VSVHE5VlNYLzZNY1B5dityTVJkNnlOdGJx?=
 =?utf-8?B?dWhFUXRaR25DSGZPczNwcHREQmJidWhicm1UV0xqR250b0V5eHlmTkNHYnpV?=
 =?utf-8?B?ZFQrcENlRzMvcGpTd1lVRmQxYS9QRDNkUVRXcmQvVzdCSVZ1YkhiRE92VUNv?=
 =?utf-8?B?dTdPc043QWFqYkJWMkpGTHhib1BGckxIOVR1cWMxUnlPY2s5ZEViNk44Z1pP?=
 =?utf-8?B?NW8xQmxOWHgrNm5jR2ptR3oyNGV4bDJJNFhvMUdyWDVzVCtZeFFVbzlMTGIx?=
 =?utf-8?B?K1hNRDlCZkFNS2JXT3pzZ09BN3c5NDZGSkFIdncrS2ZMK3VMTU5ibEt2R2tx?=
 =?utf-8?B?V09EZkhYOEx0ajduVzVwL3RaZVk0MXM3VXFOR2wvQ0RNQW0zdDV1d0R4bFEv?=
 =?utf-8?B?UmZQc3ErYW9DcmxYbStQcFNiSWtXb0VWUjlSU3ZHRzl4YlprQVh4SDZCRFk2?=
 =?utf-8?B?YmNudTYvTmRDTklQZjVQYU05M093bXNJT1ZPVU5SZlBnSGFTTDUyejEvSDdB?=
 =?utf-8?B?YWliMU94d2N3Ukc2bXdRUVpKb01TdVFuOTI5aVA1dHpQT3hEZWt4U05xa0Y4?=
 =?utf-8?B?czVXV1hidFNMK21BY0h1UC9YRkltd1ZWYWp3a1ZTSCthb05vVkEwdUJHM3ZP?=
 =?utf-8?B?MWNpejRONURYd05wcE8vcDFsbFJqUUN0RUFsMnJwZTIvMHh3VXp6OVh3VWpS?=
 =?utf-8?B?b3JDL01kemxaZHpQVWQ3WU1qN2tVb1laODVZMXF3TitGRUlWOFpqdUxFaXNF?=
 =?utf-8?B?UTM5a1hIVVZYcnd3MWR1WlF5SVBYN1Fkb2NDOXU5UTRYaXlrZytOMzRNUkY0?=
 =?utf-8?B?OVc1VmNJR0dNTGdLUDQxMWc5Tlg0WWxtUm5YNkgyT1UxL2JZb2FueHpHdTA2?=
 =?utf-8?B?SVhxS3NHNDMrUU10L2F3VHdEVmZZTitKdlpvRXVsWGVCRXd5QlNNeGwxZ1Bi?=
 =?utf-8?B?Vk95OUlraGNUeXBGenZQUkpHTHR4bHZGSk9oTXVHUG9LRnJ6SGlUVEI4bFhu?=
 =?utf-8?B?QlcyOWQreWtLTmxreTVBYnJxcjZFYitCaTFncDVQSFFrMkR1cS9ibERUSEtX?=
 =?utf-8?B?dTdQeTg1eStIdUF2a2NXS0dzWmY5MEIwVlZnRjFVVitPNjUvZy9VNFVnaVls?=
 =?utf-8?B?eFV6Y0ZDL3BzWVk1QmJ3WTNUQnZwaWx6dkg0OVFnTi83WnJOS2diN2M1WTFs?=
 =?utf-8?B?WDdUZDZlZ05LYVRIWWJPMW10VDRka00xL0lmRmM3Qk5tZ3gvaFl4RzFURVV3?=
 =?utf-8?B?aTVDbGFad1NRcXdva2cwdHdjSE5lT0YwbzMzN01yTHczVklGeEtpV21YV1ZZ?=
 =?utf-8?B?clhPVnpmT2ZOL3FGdlF0VmJrSUl4VHJNUjl2TWlRb3E2WVY5ZzIvZEU0d1hu?=
 =?utf-8?B?QmtTby9kbUIvY3VpWWVhTi9tN3psbkVwUjQzUGdlZGtkMzVaM0UyTlhvMStH?=
 =?utf-8?B?YkNFZ0tETTErNmRpUFlYN2Z2RzBzb3BseExjcE1HWmZPNlN5MlhFajQ0VFRV?=
 =?utf-8?B?bHI1YWxBQSsxN0NSYUhmZElRcHJPWVYxWVB0eUIrWld3TW1HcFQ0STJFR3BC?=
 =?utf-8?B?M0wvOHdiZnZ6QWFiY0x4ZHdJMnpwT2JwcDFVaHFaTmlIcEgvWXRHZWpQcTI3?=
 =?utf-8?B?L1JwM3VwN2xpZStjd1hFUHR3V05CeVNQZkplL3UxUVZyN3A5QkdhM0N3bnZ2?=
 =?utf-8?Q?UKLVtkgcFv6cw4PlkizsxL4Oe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ce1317-e7b6-4593-9040-08da551840cd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 12:59:48.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UsPh0PEskxRysT+H3md+2D+XWYdOoxPzWCS4R9MBcqT/jBnA661STZq7oG/ZMfaaQ0y1G43CnHiqKoz01Rm8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7960

On 23.06.2022 13:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, corrupt() is neither checking for allocation failure
> nor freeing the allocated memory.
> 
> Harden the code by printing ENOMEM if the allocation failed and
> free 'str' after the last use.
> 
> This is not considered to be a security issue because corrupt() should
> only be called when Xenstored thinks the database is corrupted. Note
> that the trigger (i.e. a guest reliably provoking the call) would be
> a security issue.
> 
> Fixes: 06d17943f0cd ("Added a basic integrity checker, and some basic ability to recover from store")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Is this something which would want queuing for backport?

Jan

