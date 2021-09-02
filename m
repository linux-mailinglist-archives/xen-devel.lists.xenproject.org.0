Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9B3FEBFD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 12:17:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177215.322513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjmm-0000jl-Ec; Thu, 02 Sep 2021 10:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177215.322513; Thu, 02 Sep 2021 10:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjmm-0000ge-Am; Thu, 02 Sep 2021 10:17:32 +0000
Received: by outflank-mailman (input) for mailman id 177215;
 Thu, 02 Sep 2021 10:17:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLjmk-0000gY-O2
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 10:17:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d40e283-a67f-4ec0-a9ee-6d6ef7aba0df;
 Thu, 02 Sep 2021 10:17:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-nJlk4btgPE6_MAMJj49RPg-1;
 Thu, 02 Sep 2021 12:17:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 10:17:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 10:17:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:208:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 10:17:25 +0000
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
X-Inumbo-ID: 8d40e283-a67f-4ec0-a9ee-6d6ef7aba0df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630577848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwOFmKTMA/e7SRGI2xHrMSVxtHkhekdm0cD8fSrNIQA=;
	b=iIY6eQghJnCL8z6dVx5wJKVWHxOXZqxv6dZkCBGhXuku/4z0eiKOF0+4drdJbzZ1a4edY6
	c9AHdNvGMqtM+skEHpNg/LnFJsDHM9PT4lMJSXM+kHNo46sjxK1JDmpuZLsuJ4NhjqCq9W
	170jhOMSaT5J5/R//gRt/SZRYa2Sysk=
X-MC-Unique: nJlk4btgPE6_MAMJj49RPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7RlemlW1Qeb+inu6gcupbATM4QtP+OXD6SNIa5hSQnlaw5hlVSjSo45OYQHNuMQSqRVjhgwfRgAZVVQIqnf+sxd2dYCp/RSEVqIkw4AjDQmjpdDgvRlWfC9s7SVG80cP+wN9NmFA9OFyoR6NlHiPVCxZR91uT6dtmrUfQN6nJa4EGe6ckEYxsaprsv2i+2BeXjpCGwa3QaV0O//Dhoatki1wqefOygoqO9Lau2sB/ULxGG3Sl13YasXQQQqeKU/+I+nD6rl3leuEJVPLYyr9/KKUU++T+S23BM2fXC/SK9GV1E2Xw/HCxVva4VQhbTuQQ7t9x3wdZ547osrfPuSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lwOFmKTMA/e7SRGI2xHrMSVxtHkhekdm0cD8fSrNIQA=;
 b=TY+aLBGKiS2Fnry1kuMHmbimQGrxqBXLfVF26Wb/ZCftu/BjkijJdqv26iYZkW69m+7bMB8IF6rWPJUFtpY1ewZPGjIsB51ZM+dd1cfHgLVcojAO99om9KI1OVZ+p620lQztP7uyAbeg1SIVYdVxw3l7kO3V58Jrk+J8vyL8HYwsHcYv1fgEueamGH4HdTLjss7sXa74CDUFyn8eoSNVvUX6AesnWmlMgoJi6288j5NKdAKI9zw/uvvjIDlUgs7wkR2e/Ja6LHjrHTSV7DZrLqoWiXt2pbPh4LdYVP0DuECVAxJNBqM0lkqiLQvqLnRl2VqNeQA4N39dreoZrmVcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 09/51] build: use subdir-y in test/Makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-10-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea4d48a9-0aff-edf0-71cd-6d87387ebb95@suse.com>
Date: Thu, 2 Sep 2021 12:17:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210824105038.1257926-10-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0041.eurprd04.prod.outlook.com
 (2603:10a6:208:1::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41f397d4-c271-4e20-67df-08d96dfadc85
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244708248CB5FD6E599CD518B3CE9@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4d/4YNm4x7CiabuWhktC1I7t+CpJaWtNHjEsypw2yX68rU3ATMX1CBo4gi52lG+ZT+GDwCacthUDAW4joDOHnSHbrdsSlt2veCZK+RGSQPWwEnqOxh+MrYaeCUMQFq0q+sUMsn1tUs3Xx9wr/6t92v5KnO9AfpEr3qnK0PtoXjapxJBLCZZPHWzriZKcNbm7tHSWFHC3FgFDMbXDKMpbjfJ0T4w4tTKFjZXOd1RA6wA4xbT4P9o7hejfp/Em8lqDko7THYvJAvKtsS+1T/kM9wNVSB6eyM2CTuFMj39BHKs7Nh0XYElV41K7lKptCfeubEQnFTEzIoC62Dwf5e5yL0+kNEIAsusoZYjxtV5D9VhopW2zYZ2ubqwAopswzjjKaW3lTW5IWificx7lAEUZUEti2VL5fWYGRXhA1u2dhTsqSccq81gqF2uBAjRwl8C/1rqtZ/xehaxwiaADnNFdKE6iYJkzi5WN+eoT86zqKaOGFj6XQEWhusl9y3+5wAp/PaWuOsIiCPf5oPKAdqWYFm3oAcTFx9XlmdpdrJNUNMwpj8rdISQSkhxidMBCUUgbd2Fnvfbz5YmjJb2ygltvL5RJQUYwalIkID8OCBcUn2UMfq8n7b2z51ZQLQQQHQTlekwmxz0LQPvzswX+R2E/eNNug4xZ8Py4tv8sbyAkz9KcABccpV5KGFX8WMCdlFicyLEcR8tQTzTACczEP23kPfumDGmJe2Ivfg5Aesn8JUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(39860400002)(396003)(346002)(6916009)(2906002)(4326008)(5660300002)(478600001)(36756003)(31696002)(31686004)(8676002)(38100700002)(54906003)(956004)(86362001)(2616005)(6486002)(8936002)(66946007)(66556008)(66476007)(316002)(16576012)(186003)(26005)(558084003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0owYXhtbDFvWGJIcTMwdmZwbFpwSFJmY2xUa0U5MjNQRTkrcUZrTDhEbkor?=
 =?utf-8?B?TXh0bUxvWnZiVjFkTk9lNWRZdVM3M0xrOGFySjQwbmVqUFpLSDJkZm9oN1Ny?=
 =?utf-8?B?YmNsTHRmZmEvUDB4Q013VXAyNWVpWjRCM2tTWGdSbGt2bVF1Z3AxYkErTjNr?=
 =?utf-8?B?cjFodE9XeXJ2N2hoelU4dkE1dWxwb0cyam1vOUpEWjJFODlUaVpUaG5PYWZw?=
 =?utf-8?B?M0Fad1hMa2FibWtCbHo1UnRqQlF6aEJzSjkwbjdmaDFCVXdDOTh6a3NnRlpL?=
 =?utf-8?B?NXRrU0M5NFg3YzNJT09CWUJudWhSLyt1MWRwM1VRUXd4bnVwditRYkk5cGZ1?=
 =?utf-8?B?K1ltZHo2ajFoMVN6ajdxUWx5VGxGQngzcG9RYmpzY1RUTlBaTlJVVFRjV1ho?=
 =?utf-8?B?aTJGcnNYMUVXMTJSM0dILy84WnFQTFpSaStiU3NxdGtXWTV3NEk4bVZid1J1?=
 =?utf-8?B?YW9TeHA0N3dqTEdMTGR2c1hSQnF4L0dFVDZ6STBEQTNRNzFGVHMraGxsdERq?=
 =?utf-8?B?dVoyWlpBdjF5d3JZa2dYUzlmMXBzQk02NjdXcDhTWHZpMnRmdk1DQmxZVWpv?=
 =?utf-8?B?QnJaNVNNRzV1SkYzS0ZoQkRNWFdQdm5tWVVRSmxEYjk0ek9HMlRWK1dXbC95?=
 =?utf-8?B?cURXd1dSSnE2K1RYS1JJWTRBWFlMMy9DRi81dGd3M2pJdTA4dG5OcStsQ1px?=
 =?utf-8?B?dFp0RjkwdnpqWWF6VnlHeFY0SWlhQWZUd2RISnlJSDA3eHJoaEFvN1JRQVFy?=
 =?utf-8?B?WUMwS0tHK1J2NzkrejZzY3lnOXVuS0RsL1NjSVVMNG1scjNyclRhUExBT3Qv?=
 =?utf-8?B?M2pVMDFCblhvNDFjVzV3N1NuOVR5cXhZK25WTjJkSUFMV2ZabWVBSFZNbkN4?=
 =?utf-8?B?d2QvNTE1ZmFPMXlpbDJYem5ZaW4zYWh0QUViTmJnNXV1eDByNnVlcUhqZXlS?=
 =?utf-8?B?VkxocFVQQTM0cXJLMjFObVgrYkl1NlQvRDBMSmNnTGlhTUsrQTlmRlpraTRl?=
 =?utf-8?B?VkxweTBhWVlqMVFhMDgzcHd2M1BTNXFvdXAxb0hORTk4QlBRekpNWDl0SnhZ?=
 =?utf-8?B?K044aVBKUEtwbkxhZjltTWlsUkwzQk8vMDdIaVJWbWFEMExobmxPWTdJQUM0?=
 =?utf-8?B?WFpsVlduNUdWL1lxaEVQa2lSOUE5WnBDZ1NETXJSK20zTnN5VUpJV0I2NWpH?=
 =?utf-8?B?dzBDdG55M0tqZzN2ZWVBZ3YvNG9TalRBRERSYWZHVW9xcHZDUmdJbUt5cXRy?=
 =?utf-8?B?TkZBaW9VTnlLOFR5ZjNvb1JEU01UclRyZ2lFcG5vUllIK1E2L3NHeVgxWG5x?=
 =?utf-8?B?V1RqWTFiMDc0OXl1NFM4eVdPRG9wVC90Y2VkMVBIdjRVc0JXWG1KSXJhNWt4?=
 =?utf-8?B?SVl2eGU4d2Fxdk9uN3NaWXRKczNOS2Z0UDBDbUYxWmU3a2NBUzNzd0NNZHZN?=
 =?utf-8?B?SzBFVFJpRktuR3RDR2RpUDFYQzJGTzR0di9SNG1wQVMySityTHB5ZkZmUGFw?=
 =?utf-8?B?NXhjSzJJallLVlNPQ21oTm0vU2VJRGpiNlhCNUdzdUJYYlBxWXpScTZlMk9s?=
 =?utf-8?B?ZmlrN1pkZnFiNDhJTWIwYnFGb3hVRmV4cW5YS2pmRmIzMW5vb2pXK0tSV0Q2?=
 =?utf-8?B?dUhPdjZ3NDBoTXhibmwycmZ0THFWTjB0ZVByLzJBdVVrYmkyTVJwbTI0ZWNz?=
 =?utf-8?B?UU5xL1pBZ28yWWhacUdzVzByVlZpcWk3QUhMQVdSRlBqWjZpVk44QnVlQXZZ?=
 =?utf-8?Q?tdr1yx6IoUbBn2OzSsstbOTEHXY6KkzIAfi0Hg3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f397d4-c271-4e20-67df-08d96dfadc85
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:17:26.0007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBnDfa0ge7derCedYuGkDbNGhwrCcr5dXwEg9NuPKOB3nJBZiswfGdfpjkucGt8T9vl0oj1uDMGvzj0oH+f45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 24.08.2021 12:49, Anthony PERARD wrote:
> This allows Makefile.clean to recurse into livepatch without help.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


