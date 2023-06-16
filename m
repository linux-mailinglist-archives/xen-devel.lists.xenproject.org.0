Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5D7328AB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 09:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550025.858897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3js-0006Dk-IV; Fri, 16 Jun 2023 07:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550025.858897; Fri, 16 Jun 2023 07:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3js-0006Ag-Ed; Fri, 16 Jun 2023 07:19:20 +0000
Received: by outflank-mailman (input) for mailman id 550025;
 Fri, 16 Jun 2023 07:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA3jr-0006Aa-2G
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 07:19:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ac155d0-0c16-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 09:19:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8916.eurprd04.prod.outlook.com (2603:10a6:20b:42f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 07:19:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 07:19:14 +0000
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
X-Inumbo-ID: 1ac155d0-0c16-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO/kaLyifzNhBvQCUdlOCfIOEoBZznPZmzHQF/YPaO44n1552TpLIMKl4dVr4n/bt+KN1zkJgJ1JTFE9gw8O/VF37Kq/ebQTlMtQ6F9irfG5WSmuPzG0UfuaE2HMnIMoBwYLCMEsQPIWVS1hTG86BF4rVaWsPAUpxOVlyEqgG9T/On80PfNfv8pOvVVzSmwdw6xBztCSO+u7nZNpDoVa34DU26bCaJ4GplodyxUg1vdHNJWI16mDTbNmnXYh7a4zgTIoy8ximS1RVTdh9XEYEcZn2YNFPRydHyDYLhGzl8ivRDSgZLtr26ZNnzf0k4Soddc4Kcdi+nyXLkcVWGTzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9GTJ1kuzPSWUrtDGYm9JyTBeMTLVQJg9R+4uoGTD1c=;
 b=PubUqC4aHlK5NyVfg29+aGfYXzm0UKhNB05haOmTw57R7ggIJW8BLUn0Kbv5uloa138vHq7qpojOiejQQilBI+UrhzP9kp4krXS3YfRCpFGvkGX5crVg6Tcn9mIvfdE/C1Y4p8KxaPevWwiK1ykj2DQzeAlcp16Mq2HqbeeItZR39hey+WMlFITLbyvj6BoRcwV6FAb7FJ/DLXivDI38BVxb5HzxJD4WWXXMuPdzelmuZkZQPFG2RMMAe41c6PVZdeN/UlLVHLc+uqpqs0CkOp8NDMXxnr1n42YBP0yrSo+JnFO8yHJAnvIBQOVJ5BU67Jh9ZV4Kbt+7Yiuh8uPzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9GTJ1kuzPSWUrtDGYm9JyTBeMTLVQJg9R+4uoGTD1c=;
 b=z8wssizdxPaFqihsg+WamUT16ZiPCHnFyC1AWAmWp/4ndq3gbRG27L6y0OAM0xYsUU5MfLCg5fQKxTSUc12tZzwEgYJEuws9Skpq/eaRozfuAIytcxKCP4dFpXKGvIxbLzKJSuaTbDSeT+ABVbZKQw5PoL3IYPDkGRXMMwqZ0cdEVUaDLTIUtn0SowHlfTJgwZWxzfrQypOdsZzNJnK7ShLTKb/slUsZM1/sjRr3li4/h/DFy/fOf5Iqd6VIGviWU0wffxkRifK0qRQETrgigcfNztPepvI5GlCQT3MBduOAfjbYhSubnBvDLWll7B6X9kW7Sj0A5/tjZUBka4OV7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
Date: Fri, 16 Jun 2023 09:19:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Content-Language: en-US
To: nicola <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e99047-741d-41bb-4139-08db6e39fd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRfqsorGixNzLJXHBOGoX36RFVfhN5ygfcmSgoUPyvmbVlGHtf8GZdfx79eO06O0AZ1BcBvVFQ8JhDK1E1zA8pa/KKJ3/WG11LfNM6mtIaumJhEQ6Hmt8S+hszvCs2R/BQhigZe7eePX3iFxIvL78XSTCEMA6YrOOtM+wv94GOKiq0KouqC9ggmo16U8hL44hIkILBOHJ+U630yOyAZNhgAjfhAxybFFnd/4/xU22zT0aYLAO4KMTjUFW9Xx9w3FAhURSUy7quEjMYCsx1g/D8ilIew3XSChY5o4oIyVx05bEgI9dNfJpQM7a5QMCCAziwBeSqpu9sc+hNu0DDeUbn9YN8t8lJyAsnFFIlg92mNXlPTIPaf+tJKv9wunaoPP58P6hdNF+25RlTyhy0R6XX5awwAuc2BG/KCGOY1wymeI/9S/LDIQvVi8tK6/O0U+d2WTKMBKYrPy+N0CNyGGUSYRJozFGIuRJp9Dsl9XHOe8ZM4h5vpxj//iWOE4/tCYIbIRE3PaDWZsg0YacHLFCWLYmHHCa2ks3IGNJaekpWSGTsqzj39pDP4B1ZQEHQppQL47CEhEQuudJtbND27/7UcWlFb6qJw0c+2yWcN6o6wcmHQFPclFBleiIwznnIYEw2CJMTkn1nH3nAPGKT8EKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(31686004)(86362001)(31696002)(38100700002)(8936002)(8676002)(5660300002)(316002)(41300700001)(6916009)(4326008)(66556008)(66946007)(66476007)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(26005)(53546011)(6512007)(6506007)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWtmbVViNFV5UXVYUGsyY3A2Vy9xZzlnMjVMdlVtZ3dOTDl0RjZuR3NmWlBI?=
 =?utf-8?B?SE5UY2JvekdaNnM2RXlDam42M292YkJDNUFleVgrWmlybGFYNnhUYVZ1dklY?=
 =?utf-8?B?c3VuN00ycysyWFRUSmtlZTJaMkI5K2I3ZmVjZHpEcWszamxnM1BNV0I0OWxn?=
 =?utf-8?B?MG0vN29VOEEyenNkZEdUamlITFlTekI2SVBKcDBlM1cwSThkbWc1VDdMQk1o?=
 =?utf-8?B?V1NlSGV4WU9YWmJhLzBEZ2V4cGRaaml6QTZtSkRPeDN5c1ZNT1Q4M292VmpU?=
 =?utf-8?B?WVpBQjJvZkQ3c3RsMU40VUdMd0l5dDBHV0hjaFZCTW9TMXpCdjhkVjZ4dXJY?=
 =?utf-8?B?SUhkV1JyN0pGb2Z6OExCd05POVVjUmh1clB5a1lPQ2syTFl0aDliSFVlK3VK?=
 =?utf-8?B?WUIvWVUwV2FRbGxmMDlTa0YwWSt1L3A5VkwwSU5sbDVDSUdzRWwwOVppVDd1?=
 =?utf-8?B?SzBQZnBqS2RxNHFpZkpuZVhNMGtONXNzeVVOS3AzZFY2ODlQenV0cExSVVli?=
 =?utf-8?B?eXlQeGtJeWhzbG1ob2ZEbURuQXVDcVdLV0FqblJtNXJ0SkNMa1k0WTRNZXVx?=
 =?utf-8?B?N2pXVDV0a3lZTkpMck02OUgxOG1odlU5aHNLVkxkci9Sdmk5SFZrTTF5dTQy?=
 =?utf-8?B?T1ZsUzFzRjZwS0xnK05RK2V2Q2hiYktmcVVpQk5vemYra0VpSGRsNy8vdHJp?=
 =?utf-8?B?MDNrNDFkS3BVNXo1aDQvdXRaU0FPUFBZaHhvcHkvb1gxRlZweExYaTJGWWRC?=
 =?utf-8?B?YjFQbTk1VGgrQTJjU1FXUmJJY29TZjYxSG5vcDFsajJCaFVscmM2bVVuc05S?=
 =?utf-8?B?R3lYUDZ6YXB4SzlrYmJKaWFtOWR5UHlVU0lSTlduN1FUSloxR1lOZ2JhZFl0?=
 =?utf-8?B?YVMwOURLR2JFRDRDWlcwclBXSzdXWVVQTW10UEYwNEVSZlZNaGNsdW5pMHkx?=
 =?utf-8?B?dHhtWHV5UTRFdGNjZXlCanNNcnJLTU5jU2l3RlhlK1BxSDRocUUwOU5EV3Rv?=
 =?utf-8?B?eGdXbmpRWHNZTmxPY09XQ0ZqaGh1SHdxOFZhWmFTYVpzZEZKUlVrUUZraGZZ?=
 =?utf-8?B?UDdFeFF0RXIxOXc5d1d2dzVYZDdOYVZLR2FwNSs4anVQdk42SWY3Slh5SGIz?=
 =?utf-8?B?bFZyNmlFQjhZMnMzcXBpdFZNYTJmRnhzTE9sb2pndk9wVVJBSDZYQW1ORXVZ?=
 =?utf-8?B?WjRxQTQ0SHBxQ0tsdmdTbWE3Rm9rWHF2UXo5NlMwRnhRTTZCa2VKRWxSL2ty?=
 =?utf-8?B?TmpTREdMYVNranp2ZkFIamVPZ3pRRDFwbVV1KzRwaDZrN2ZBRzZHdSsxUC9P?=
 =?utf-8?B?aTRDRDk2WmpRY2pWZktYY0haY25panhTRWdVNjU2VFFwdDhTY1hHYmhFaUhh?=
 =?utf-8?B?b1hTZjZoWlVoM0hKaGJQYzJwUnJ3Q2N5dzZhSmsyc0xkK2NaZThOOWE0YUI4?=
 =?utf-8?B?SyttNGZrbUwzcWxzOEhQY2dsaDdNQkRnTEEyRE8rcHBHaWlBeWNCa3NVQnFz?=
 =?utf-8?B?Vk40blNqQk1OSm1yaTR4aEpVcnAzdlpQeXpYcHg5eTRjTHlnU0pIYkV6LytU?=
 =?utf-8?B?M3h1NjZDUWJONlE0MmlMY3Zza0ZzZU5EZlZ3SlgwOWFPREpIQ00vQ1JEamN2?=
 =?utf-8?B?ZXBRQUdxc3VzWXBZZCt3M0lreUhIUldaeDFmZWFnaXBvQXgvZngzelRMTjIv?=
 =?utf-8?B?c0xoaGE1ejFmSzBabFdtdVA4VG53RGNJSnRsbzZLTWhDZkJFMWNRYk1Hc3E0?=
 =?utf-8?B?M3B4YVVzRHAyOFNVdVpJT3ZDUmVWYmY0Nk5ncWlqRDBXTVFZY25LaFhkSTAw?=
 =?utf-8?B?REM3aW8xOHRtVFUvbTcxcXc2dlBKWWx6cFNwcVZWOG02QWpDQkJ0WGU5T3RM?=
 =?utf-8?B?aW16OWlzU09mNjd6aFNTdWd0Tmc2T3doUVJOakhUcUNGUFFzaGlheSs5VU5R?=
 =?utf-8?B?SWdTNjlFNnZUc25VVnd3aEpjaU03b0Rtc01iWWIrV1dxOGk5eDhxUlQ3aEN4?=
 =?utf-8?B?VGRobFFjOWZGYURMeCs3RldxTDZyMmVubDBQS1FtQTVIRUYzS3paM1hEWWd0?=
 =?utf-8?B?bHhKRWtZMzdPS28yOVNST2pwUUN4ZWlManJwOTBGN3dhd092Wm53elU0eWdn?=
 =?utf-8?Q?pXUIHV/NGDvs/HRs28fHTAILz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e99047-741d-41bb-4139-08db6e39fd6c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 07:19:14.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyEUDih17gEcYGTXvEDd9J1XOEyySOH2GQACKn95jBj28yXGeUUNn20wWYsxGX+i7v5LlbcnnGOAcozbMoBrmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8916

On 15.06.2023 18:39, nicola wrote:
> while investigating possible patches regarding Mandatory Rule 9.1, I
> found the following pattern, that is likely to results in a lot possible
> positives from many (all) static analysis tools for this rule.
> 
> This is the current status (taken from `xen/common/device_tree.c:135')
> 
> 
> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>                                             const char *name, u32 *lenp)
> {
>      const struct dt_property *pp;
> 
>      if ( !np )
>          return NULL;
> 
>      for ( pp = np->properties; pp; pp = pp->next )
>      {
>          if ( dt_prop_cmp(pp->name, name) == 0 )
>          {
>              if ( lenp )
>                  *lenp = pp->length;
>              break;
>          }
>      }
> 
>      return pp;
> }
> 
> 
> 
> 
> It's very hard to detect that the pointee is always written whenever a 
> non-NULL pointer for `lenp' is supplied, and it can safely be read in 
> the callee, so a sound analysis will err on the cautious side.

I'm having trouble seeing why this is hard to recognize: The loop can
only be exited two ways: pp == NULL or with *lenp written.

For rule 9.1 I'd rather expect the scanning tool (and often the compiler)
to get into trouble with the NULL return value case, and *lenp not being
written yet apparently consumed in the caller. Then, however, ...

> My proposal, in a future patch, is to refactor these kinds of functions 
> as follows:
> 
> 
> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>                                             const char *name, u32 *lenp)
> {
>      u32 len = 0;
>      const struct dt_property *pp;
> 
>      if ( !np )
>          return NULL;

... this path would be a problem as well.

>      for ( pp = np->properties; pp; pp = pp->next )
>      {
>          if ( dt_prop_cmp(pp->name, name) == 0 )
>          {
>              len = pp->length;
>              break;
>          }
>      }
> 
>      if ( lenp )
>          *lenp = len;
>      return pp;
> }
> 
> 
> The advantage here is that we can easily argue that `*lenp' is always
> initialized by the function (if not NULL) and inform the tool about
> this, which is a safer API and also resolves almost all subsequent
> "don't know"s about further uses of the variables involved (e.g. `lenp').

The disadvantage is that in a more complex case and with the function
e.g. being static, the initializer of "len" may prevent compiler /
tools from spotting cases where the variable would (otherwise) truly
(and wrongly) remain uninitialized (and that fact propagating up the
call chain, through - in this example - whatever variable's address
the caller passed for "lenp"). IOW - I don't think a common pattern
can be agreed upon up front for cases like this one.

Jan

