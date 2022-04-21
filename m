Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741E509BE8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309950.526479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhSzX-0001LM-VO; Thu, 21 Apr 2022 09:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309950.526479; Thu, 21 Apr 2022 09:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhSzX-0001J7-Pe; Thu, 21 Apr 2022 09:20:47 +0000
Received: by outflank-mailman (input) for mailman id 309950;
 Thu, 21 Apr 2022 09:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhSzW-0001Ix-DF
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:20:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 529e5a80-c154-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 11:20:45 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-TLNnFqlcN4W8KFJd_nAFmg-2; Thu, 21 Apr 2022 11:20:40 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:20:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 09:20:35 +0000
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
X-Inumbo-ID: 529e5a80-c154-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650532844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x38M4jTtVVsfp07hlSV44EN3P+EHzSj2fmdtntSAjNg=;
	b=NQzZdKITOpUy7TcyK3tMNMxqKYJQvFEmAh6FAN7Jlmz6axHD0Dg5KBF8m1zjmYvGogWjq8
	9N3u1MRCMu2Z5/KM9avf4Lo/T3EqCmqQxla64XfKY43tB3l/UXSfJtaV3EpV8QWDakAdJG
	893ZAMWVrixQoHjKn2A1gBa6WJ0zs9E=
X-MC-Unique: TLNnFqlcN4W8KFJd_nAFmg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+3lVtzf7IqLaaTm4kwnC9dtcgVU14reUl5FMuB2RBTy3p3Gqxyi43xCbkWZvh+TcpDJEC6BDq6nhdY4csTNC0OT+r/FK3cHt7PE+9uokVJEuc6KGHg2lG6LLu1VO+lCh0gItNb8JHhnEJT3p2DB4cZJkfhGx8XC2dN1UFqpmazptogE7NZ8UlqfiXK/EyZ53dDCZ7793ynskDSBI7c+OEWaFa9Zv8oOjOLzR6A0rvcS+5CnbZ9dAt6ptxatgf1NMd25YBp0XRapEu/UXxjtjS7wSMup7SXeMVScehCpphA5Bfeav8vKAu4Id4+zqEdKNBgTr/keZtT1C5eB/mkCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x38M4jTtVVsfp07hlSV44EN3P+EHzSj2fmdtntSAjNg=;
 b=SVpbeZGOnBa+2jkXfllrtBr/AcOiUT+RZ3u/hBTM3FKiLR90WAyINwQpU1JCXSmKVym5F75qARki1lYxfZjvR7SSPtc2JXn8q+qDj8fyXBkolFhXYc/x8Kd3bjCEw/XvI7wKp8xOiIEz/iqPLmrYLK01i/QusDJxajTFXEUjosBICqPoqw21Y2ZXuZkaSOtYq2S5ynBKHc56zQT80szDCmysFVSjYdLge9L2CRGMVAcM2arqoOO8MzyufPr04aTs4uI8DiohTxrh/5subXZFvX6BIUjyZhb86dWKwORDux+2TDzTx1l08wSek1UWxar4oFcY0EwT8IaayMu4bWRGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <256567d3-8d0b-83ea-c3d6-215f0a1483b6@suse.com>
Date: Thu, 21 Apr 2022 11:20:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/2] xsm: create idle domain privieged and demote after
 setup
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420222834.5478-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5693c3a5-6c5f-4c2d-1846-08da237830c9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445E6FCC7D7A2F0429492E5B3F49@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WenhevGmKIFtVQH9YrXfoUjhPhFZ6HwrTV4OwlB/BWKAqBmwemG4swim4ui6/LlrkwoldOJeuTPw5lFtcKwYbRrIljkDCHRQ3V//llVS5MGYwruXb+0FvNxgMOe8An+W47RI5C5gTVd6oNOOX7gu2sPttA7bqUhzfYBCFIudk8fM/q5/HhLkrx0KTFxfR8GaGftu+q8SS0sIO83r6b3mTvDI8gqToHP0G0pKpubzgRpFcpSTFyNJpi6hUhJ2EDuBfA54wkqqx5RGBq4EKYiQCAzIsBgb0tj10yUA3rrKrA7vP3lmRJBWFTufrNR1SE/i4S7dLRPpZMpcQVlK3VFbwmdt/0HppKa7AqBOOOjTicImSq6l4WX8kprooiM+6UEEQ52JKtHwDZm1O77otArkmM0a4dEdJxLnfnZRW7jWocZiiaFkzEzoLNgji93gujyvF+ozfnIxl5Dr6JxOmMSiZUZPWCegjHWsp8FDSio06dPAAvg0lRFvn4vv4HBPthmYkcMUhimNwdTplh/y0b2qFoGImnTXl/p2WkGnGNQTUvFzK4RlTZik+r4WKj4F0yPpEoOmXMQoGZQD/uge9Xq5JAZO+5CUmcRQ/sgK43f3cuTIrnJDXPkwB/uDKEZmd1TXzOrdYPs4eEBwNz36y5XQdpfR1D+B09PWNkwM0iKepycEvV9s+ASTEIliI/uAT98uVNVY+vMFvYDgJnMD2/xiaIcq44TsEdxyI2o2zdI5Zj2rPMqekmqULJxcVEhIqZlB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(508600001)(86362001)(6486002)(2616005)(8936002)(66476007)(2906002)(53546011)(83380400001)(6506007)(5660300002)(31696002)(186003)(7416002)(36756003)(66556008)(38100700002)(66946007)(54906003)(6916009)(8676002)(4326008)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJ4bWNSbHRhYW1yWGdraHFMUUNROHRtbmgranlpeEY3KzFhTHo3eFdLVkUw?=
 =?utf-8?B?dEpQZVRQRHNURzc5VU9PQ1lURDI1cSs1a1hGRys1NFVoMWlBNVptTm01Y2E1?=
 =?utf-8?B?NDNMY0ZLRmh2dno5MlgzbGxmUjlaR0prTnNPcWV0eWFuMDBKZlcyd2paOU9r?=
 =?utf-8?B?eUptNVI0Zy9XcFJPMVp5b29zbkZxYkJ0RkNZakFZczVNN3cyY0k4TEFvTU56?=
 =?utf-8?B?M0N5cE1DUTVHL25GM1BBT3hUaVdtSTFrL1FQU3ZwWjVEVGEvazMxOTV6QnBp?=
 =?utf-8?B?a3BjVXUxSW95RkpzRlFWczV3UXJYRGpEQVlYS2syVyt0UHg2MmJqZUpPOVVQ?=
 =?utf-8?B?aFE4SXlVcGlvc082M3o4MVNSZWtFK21xZUF4VVlzempDK3NaRFQvTGZUM1Zr?=
 =?utf-8?B?QTVZRlh4aDhpK1hxQXR3SVN1MkV6bXd2UUFXREwrWkFPT1c3NndQQlZ1R3lu?=
 =?utf-8?B?Y1B6bDRyTFdTYzF1UVRhcjVtMzBsMFRCS2RwVEFlQW9PQWlxeUhLWlJOSENj?=
 =?utf-8?B?VEZna1BQSXJ3dDNhWXJuT1BETVNFVFoyMzVaSGxUQ1NpRXpaZnZ3ZkdHSnVq?=
 =?utf-8?B?Y0Nxalh0bXBqTnJrblpzSDl0bEhqVjlQMjFFNkJZbkRJT2JpVWUrbGsyK25q?=
 =?utf-8?B?bjVhQzlKcXRPS0lXNlViMWJ4eUdzTlorYmZHNG9MZkNhMmRjSlJldGVmOXlL?=
 =?utf-8?B?THFNMGY4RTRwQzh0MkdsUVVBMm1ZcDFKT2FsQW9QeVZoQkJ3VkN6MFcwWkd6?=
 =?utf-8?B?SlIyTXp2YWpGYVUvVFZUQ3c2Q1dVN2o0LzlNWjJYVTRwRUF4S2VLeDcyejBy?=
 =?utf-8?B?V3Ric25wWEdkT21ucGhmVEFKaXVsc0tpUFkxOVdjUERIcHNjTjF1N3podkdL?=
 =?utf-8?B?VkNHQlh0NU5oUTNaRThqUUxPa3dvc2h0WFR1VWpkcytWWjFRZExVMkpmRzRJ?=
 =?utf-8?B?dkxub09QZExQaHludmN3QkdnQkpKdFl6TXdGRDNRWUZLTjVCQmlUUnJqV1B2?=
 =?utf-8?B?bTFVQ3VQMGdMd2U5Sk1WTzNLS3hRUFpuVndnNk5WZFdValdvajVEZC94V0tl?=
 =?utf-8?B?SUJRTzY0dG9kckJiR25mNW9ZWGlXRFdnOUNNejZMRnc3TXpOMlozN1JyR1Vv?=
 =?utf-8?B?R2RJbmtBVzUzYmQxVEdtRlVRaGxGcHhtWlk4NVhTOTl5Y0djNUVVRzlzYUd1?=
 =?utf-8?B?RURnaE80UWlFNko0WDErS3ExdUxmY3JmSGdpdEd6Ukkya1ptbm9tdWhWUjhx?=
 =?utf-8?B?OEJlaVh6U0I1M3hoaW5PaFlZNUZZMitKUHIydHV1QTExdDZmZkE3OWVLSTFO?=
 =?utf-8?B?YU9xY2M0ZWI2d0QvdXRIc0xJOXU3SXRJSk1TMWM0Z3ZNUGYyeFNIUjFlYXRQ?=
 =?utf-8?B?R2ZlblNuQitZR0l3ZldCVHl0aVoycFBldVAzemtEaVNsOTdQRkFuODUxSC90?=
 =?utf-8?B?QlhXSXRiMFJ6OUxNdUZnbTlLVlFBZWR0UTBBbjNrQ2FaYkRVNDZZckx1VlU3?=
 =?utf-8?B?Q1ZmOTlvSzlIRVB0bkRxTlFJVjY4LzZGRG00cXl0djN5SUNncWxkM21hU1JW?=
 =?utf-8?B?UGczdnY2SkpCdTN3dmpUQWV6NDdpWlA4SWtSbUVUbU5EaXR3U2F6blBMbFdL?=
 =?utf-8?B?OGJiWGorTlhabUFnNzNCTDYraWJLV0hHdWFkN2RQR2dhcVFiNVJiQVFQSVd6?=
 =?utf-8?B?Q3hXU0k3UHM0anNyajY2OEZRZ3VLQmxISkorcG1qZm5SZlc2bk0yNnZSVllI?=
 =?utf-8?B?OUhYK1pvMGdnMUZnc1prdTFhQVlTU0doVFJvSDV5d2xZaUpCUzlNb0xMejds?=
 =?utf-8?B?bnY5Y3kvQUR1dW1Bc2tiSUxyU0J1MnZadGVndnZBNFNOU3dRRENrRXFTSFZD?=
 =?utf-8?B?ajg4UHYyeFV1NnNwb1NXQXNOQkxDNjlJdXBqaC9VTTRJa2UzcnQ5QUxrMzZo?=
 =?utf-8?B?Z0ROL2dVM2gyVzlXME92QjNMQ09aQnhwSm9ZV1hKcWJNTGl3a1F0b0EyeGo5?=
 =?utf-8?B?SWZKbEMrSVUxc25oT01XeGhaOTRIQ1p2QzNmb0luM1ErV2VicEN6Vm1uTytk?=
 =?utf-8?B?Z2tNdVVxV2FwYWQxOFBDc0pWWDZaWnJ1bnhzVDhlLzNxZjM1YzBsYnJBRi80?=
 =?utf-8?B?VGliMTRvMndMeWpjdVVCQW03WlppSDdlNUI3bXNmaW80VXROcVVSYklZbUZ5?=
 =?utf-8?B?WTZ6KzRzcUZGUFA0SVFXQTVUTkkxWGpINDVkbktOcUlNbEhBM0VXb3QweVlX?=
 =?utf-8?B?Vm1ZTGhVU01UTzZwdGdTR0ZzaXlzaUl4WEMwdk01Y1lRMEt2cUlvczlqVGI2?=
 =?utf-8?B?eC9ycWNlSDBJN0gzcEdRdm12QmNvNGFYbDd0YVUxQXFVVU9wTlNiQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5693c3a5-6c5f-4c2d-1846-08da237830c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:20:34.9441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYJdVJ6/I80ne/b4EU2BpKNfCBH5rY8v5g09+8YHH1GSB6hF+i7ySpayUIERgr/u/tDGlWwlxnNXmBJicQSuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 21.04.2022 00:28, Daniel P. Smith wrote:
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protectd by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit changes the idle
> domain to be created as a privileged domain under the default policy, which is
> inherited by the SILO policy, and demoted before transitioning to running. A
> new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
> type to demote the idle domain appropriately for that policy type.
> 
> For flask a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_transtion_running.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Looks okay to me, but I'm not sure in how far agreement was reached on
taking this route. Just one nit:

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -101,6 +101,18 @@ static always_inline int xsm_default_action(
>      }
>  }
>  
> +static XSM_INLINE void cf_check xsm_transition_running(void)
> +{
> +    struct domain *d = current->domain;
> +
> +    if ( d->domain_id != DOMID_IDLE )
> +        panic("xsm_transition_running should only be called by idle domain\n");
> +
> +    d->is_privileged = false;
> +
> +    return;
> +}

Please omit such return statements.

Jan


