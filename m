Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294AA735985
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 16:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551149.860513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBFtG-0003Fk-I3; Mon, 19 Jun 2023 14:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551149.860513; Mon, 19 Jun 2023 14:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBFtG-0003CQ-Ey; Mon, 19 Jun 2023 14:29:58 +0000
Received: by outflank-mailman (input) for mailman id 551149;
 Mon, 19 Jun 2023 14:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBFtF-0003CK-J4
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 14:29:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c331c6ea-0ead-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 16:29:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 14:29:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 14:29:52 +0000
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
X-Inumbo-ID: c331c6ea-0ead-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYMIZHAvp04sD9GoYS9F0kGIa4GMJeUNBho7zF5vFVtDOAxhkzbjnas8HbKK4YqBjYfg5aTovI8F5+/JJW66LD3sgHHrC61Rr7iPJSRLCSWBdr5IKCbCeU4CMnXwoIFZeL8bqGDja40OwUHF9syrn9e1QLx/IWaFuZD1kPd4hn3R7mx8rP7u8GQrUxiK59X+8Dxf/cexeytbPPT6r0S3Hv0KObCiNndi/FiR23EK/PdicLMKYQ7ReC/fAYhG89eNMUHDh5aKKYRZmVFjIeutqKrhNPjN555rrpHinNnTa+WWay47pGk3gw6aPHPv1JwSEsHdd950rjDCuCe3XYBiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P2jq27n9mgTwscI3FBHn8HGohnbYSV6BCHigbLG9kI=;
 b=SG7sFtDKPQI1mT3wNM3F8CPgFQh/3IZNTNmsXcuJRvEqESzDfQ7hc6rS7M3JPZ+bRIE/0JYagnbPF4Zn7ICvysV2gfebAaRI3Awe2ZIEwbYiTsvaC4/eFI1Trj81cigaEOLXjhdcI4OuID9I8bo5F7dksm32jhkpWPlL9qt3OPrMjx5ABi8MHDSK0qHguTXPW32/Q+rm8o2Q8QpMnGmYMnIHfjknzWBVJsoKfNlfsVCyTIEOUMTCdoymEWPFk8M0Dhwcl2RC9J7ODYWzbT1bV9se9liBe2tvL3mWkYsL7ayR/qGlL/rrOWLvnPPbnxQIpqXbw56xS5Myq3Ba7vsj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P2jq27n9mgTwscI3FBHn8HGohnbYSV6BCHigbLG9kI=;
 b=vVXTRZH5EGxF/xbcDIM75ISW+h59O2jDKJDLoIqTXVZ64JqMuyQvgbKqfPfsDWnYlxFxAdqPdx9iXOK8UZtjJ9pxwfZTTa3UxMFhcPMBqnFcD4KZbKqaD7gYUERq5ZiRwnjZ/cfzrPuzP2GiNQa9/a1olOd+j6nd+lfXbsMTHFAkqEh7vZBJdKtuACbh+nSs+uOzD4iV2rqg7FbLbIouJtMstKh1zUo1LU/V3qEn7Wddt8YrQZ+8Po8HIrqnwYkL6LpHsQJY0TkRPkBEv7jaWNJYWpAJ4BGDmpD2J3+uKEdNDb4LJI7YSA9ZjU2Cu0cpXpGGU9bhH/FO4JGNC+M32w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27a328a0-a68c-93ea-25fe-41a97c3163f6@suse.com>
Date: Mon, 19 Jun 2023 16:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 11/15] xenpm: Print HWP/CPPC parameters
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-12-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-12-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de49ad4-fd9a-40eb-c283-08db70d1a4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKKsh5n6T+LJPJ0S6VddEYA71SJvjwigZLS6sZBOtZBLIE1zFeJnSWHJvpvcSBEf6/cHARxjsXxYoUYaykZ0vv8iUoGZjEPmJYXbKpCF4fUBIbBiRptWLVLcvzfHQIRbP19IQPQYHYpNVqjC5GKDrFG9nwM6dcdM6TP52DTre/0z2E3kHmLU+Vnjhix6jEJt4GY/6AFaSqPl4otJ/YDqVOcYjgUJ9hsAGtVJDcHKmJjMDOnXfAZoiCKASyc7/3qH+CYFLVhBqnP6RS7O730TDNaNbGeF9gUlObLVWGe0FybBDCxlbvwZtZDf+9pBHDVVNpTVxPOTVZ/gUpiYH2ppgOlupDvE/WkKrldTerecoCd5U/I6HSv/vbgRL+BmJh5/BA66wmcpD8/VdakQndkNSeodF5WrY1gxPv9TKmd9BJ6GDxuWlqiiylmlLFj3vc3pWQhg5qTjgMnRRh8UeZaIv5zobqsYJKpynna/LeIuIL+nLD2BDnp+RqiOFHnWdvlPKd0W00Q7jgL3rrb1+Vu1T20byVSJFb5fbRn+4g5EaaA2uiHmJqh8F7TVq5XFWSGG/PQ/xsnZLfy8U+OTELlN+SD7KwZSlST0oDbqfTQto6Vz0dmRx9p0SedoOvukbF55DAU9ZHz35YQfXMGLWhjvQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(136003)(376002)(396003)(366004)(451199021)(478600001)(5660300002)(4326008)(6916009)(66946007)(66556008)(66476007)(2906002)(54906003)(31686004)(41300700001)(316002)(53546011)(6486002)(8936002)(8676002)(6512007)(6506007)(186003)(26005)(2616005)(38100700002)(31696002)(558084003)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0JMaXpjeEg3ZnJ6MmF5TEZWY2pCRmlMU2tvazVMNUFSRDl1VE53M2pSLzg5?=
 =?utf-8?B?VnlxNEx5RStleGZlQmplMkwzUytPN1RBMEhqQ0M5bmtBMWh5cHo3L1RaYVBD?=
 =?utf-8?B?NDNlOUF3c1RzNThiU29UQWN2VGlMd2hTcXVpdXVMcFNmV08vUk0yVE93STZH?=
 =?utf-8?B?aW41L1lkbXpaN0hJa3RNRkMzejUxSXFHR2FEdGNxeEl3bGkzdW9ueWh4Rjkr?=
 =?utf-8?B?aUE0MHN6cGRhNjl3ZmFLNzVwSytMS0VrZi9LVmZNYWxQRzhvT1BWN2hQZU1Q?=
 =?utf-8?B?OVhCbVUrWEF2dzJRaDdUTHQxS0N5REdZd1ZwU3RJVHVjckZFYm11MGFuZzhP?=
 =?utf-8?B?cTQvNHRyUURRS2tBYzBMZTFMRG5ORW9sWmY4QTNnVndubjdxZk5SOEFwRGlN?=
 =?utf-8?B?UlBJQWlZS1czWEJWenl3QmVPUEt3Q1g0WHBtR0IzRlY0NHQxVDIydUFWb1Vj?=
 =?utf-8?B?U1E0VnoyQTJNVTlFRjVWTzN0OWZweHJORE1vV2dHN3ZjbUlPOUxjVU5GQWE1?=
 =?utf-8?B?NDlTTm5XVmZQM3VNcHRkeWlob3IvNWtuS0d1bDg1VWIwMXFiSjhrc0xVcDMx?=
 =?utf-8?B?N2pTTW5scVh5OERGMWRqbmNhZ2RjbkpCbkhLSitHVzFLL25WcGF0NTZ3YUY4?=
 =?utf-8?B?amVXcDlMSE84ZjBwUEgzODBVNnB6dHh0Q1pKWG5nVzdPTW5rQU5XeHFwNzZL?=
 =?utf-8?B?SHdwRGlvYi8xZGFiRUtnWEhZWDlpVk1hNGcxeW9VMVJIS0U5Tjd1YTlKTXRC?=
 =?utf-8?B?akU1V3ZNSGwxSGxYUGxuT3ZBTHZ3Mk1qWXRyVnlDM0R2MzRFTmNnUWRVeXZp?=
 =?utf-8?B?TVl5WnlkY1Y0MkREQTJMUWFlMHYyR1BJbkhmWW05SWZsaUJMY0FUSnpydU4z?=
 =?utf-8?B?Z3UrY1Vob0xOQW5hbHRvdlJtblIvVUxDcFBaL0phbHZGNTQ4dXlRM1J2K3F3?=
 =?utf-8?B?SWl1L0hEZmFFallFeG5raWtvbnFveTArQ01OWHZMYldyUUZKQU9oc291di9j?=
 =?utf-8?B?cUk1MFBPZzVmenpPOXZCVk1FTm5YTEdrYWNMRzJvVnRkQ2xHL2cvcmVWVGU5?=
 =?utf-8?B?RmZmdm9JelNJS3dIUjM4WXE1N0FvZlB6RVJ0Y0tuNUlrcTVhKzJNb0RsMXlD?=
 =?utf-8?B?U21GMHgyNTNVbTEvRVZBRUFlUkxIaHFYekUyRDFmcmZZRmJHVEdRRFUwL20y?=
 =?utf-8?B?UkhsS3hyOW5EcUd5U3FhTHJhaVQyQVVxR3Vrd1RoUmdsS25qemZMWW9KT1RD?=
 =?utf-8?B?a2lYTzhCbk9PT1dJeG0wWDJvRlRkY3pCQk56MFpZRmVBSkg4L0xpVS8zTUNL?=
 =?utf-8?B?Qm45OEdCME03MUdseUVJMGlNdXc5U2dWZHhvNCt4enY4REtZY0tPR0tJTHpi?=
 =?utf-8?B?VEVqN0N1N2p3ZXc1NVR6bG5HZTZEMS93ZldyWHJrcEt3M0dwc2pTandramJp?=
 =?utf-8?B?U3VueDI0VXpLSWF3ZU1oanQzTlVzT3h5NjFPd1lLZHZreHZlMGFyK1RjV0FQ?=
 =?utf-8?B?UW01amVZQ2RQdE52KzdDR21ZQkdHUUVyLy9jY3MyZDVncHhUckxSSUhUNXh0?=
 =?utf-8?B?czk4MmtvVUlwYkpzeHRNWEJJMElzYlA1b0YvaXlxZnF6Q3FMTWFPYXFVcDdz?=
 =?utf-8?B?cWZkRnhDbVM1aVNIbUd0eTZuMGk2ejVpQmhQaXR3Z25OcnZVSEdIZGJ5eTBE?=
 =?utf-8?B?dUpnRkNyZFA2V2g1SHVqeHNRNnZiVjBwMTRXcDArNzUvSGtuUHRyMmlQK2JM?=
 =?utf-8?B?ZU1EbjlLSlEyekg1b1FKZmpXK0V6WERBU0xFOEpvbW81eVRZU2xOK0tlTnNr?=
 =?utf-8?B?ZWtYbXh1SnlRampsSWJDeVB1V1N3eklvbFRieVJsZ1dzNFkwQTJSYUQxRCtw?=
 =?utf-8?B?YXhkWGJLalhvdC8vaW5mdzdFODFsazZVN0h6UHY3NWpPVVRzYi9QUkhJaStW?=
 =?utf-8?B?eFR2WWRwTFI4bytWSFFubUk5YVpEZHZ0OTNDTXR3MytybEVrWTlYdkV0WFdi?=
 =?utf-8?B?c21yMXJhSFd6dlZ2S2NyZWxoK0tnTVU0Mys1bDV0TlZqb2ZtK21XUlovRUsr?=
 =?utf-8?B?V3lneDU2YXBhT0hZN0NYcUo1U3dqV1BteVRDYmZ2OUdjdWROcE0xaDBzWDF0?=
 =?utf-8?Q?CN6BwnIRnoubh2W3eFBfQ/NJN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de49ad4-fd9a-40eb-c283-08db70d1a4ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:29:52.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SKUs1QwWi9N2ZgwZkqKZzcjGWVjtfzT3usDW7wN81mXMwtagEN+aCZmpRlpXel9eh6an9FZKCOzGeWzxS584Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758

On 14.06.2023 20:02, Jason Andryuk wrote:
> Print HWP-specific parameters.  Some are always present, but others
> depend on hardware support.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



