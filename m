Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1B3B1432
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 08:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146144.268858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvwjt-0003IY-8N; Wed, 23 Jun 2021 06:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146144.268858; Wed, 23 Jun 2021 06:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvwjt-0003F9-3k; Wed, 23 Jun 2021 06:51:57 +0000
Received: by outflank-mailman (input) for mailman id 146144;
 Wed, 23 Jun 2021 06:51:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmAD=LR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvwjr-0003Ek-Q1
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 06:51:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e26dedd6-dc9c-44ca-8d94-34b1f62afcad;
 Wed, 23 Jun 2021 06:51:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-SOlpFAFdMDOinD5Y6leH7A-1;
 Wed, 23 Jun 2021 08:51:52 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4148.eurprd04.prod.outlook.com (2603:10a6:208:5f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Wed, 23 Jun
 2021 06:51:50 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::d52b:45ce:e793:f9c]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::d52b:45ce:e793:f9c%7]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 06:51:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:208:1::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 06:51:49 +0000
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
X-Inumbo-ID: e26dedd6-dc9c-44ca-8d94-34b1f62afcad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624431113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKc7QJIF37h3jBkPcG1fjLAfzoeytO1fLL3nk2/aeWQ=;
	b=eM+gCsI4PNTbphbnH50Oy9DXt1a4BoVLRWE6LuFDsUCVv8XRKZB1onsoM+eCeUagwrs1XY
	lbDvmtZ1AQX14kBQKi3+ZOH6/UAO03G/smDfp/25A5QOhbUb700g3iAdgPFOV7nrln8F4j
	+dFyc1JldGXJ4tb52Qy1wUu61mHrfPc=
X-MC-Unique: SOlpFAFdMDOinD5Y6leH7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7oXWmd19KAcJoUK2BIyUKOCSN1KRXU8NkR/AKJgVhzOoChY2RMYp2ExnbiMm00t+Dl1oJyj2BRxMBXJ8CX9KlJCENJmQQPU6hLqAlZhyd9Ny7vjkhpQdbLNxBISQohJnTFaY3ud3Kks7qx+9uivLOctlU1MNQc5uAsJplgb1iD3+dzc3dbnt1RlyQZsm3PAqwZlutLnKAT78/0KKVnOgRXCcKgltwgs/3e0RLWsnK05qR5jzza1SjXn9g6SgIe1OgTUpneOE2mmfNbicwZDFXbZ1KhJ5AV0xAbC4kZrOEKUQD3CxZAOHhO6BkrqZ3LZnQgT53Sys2yFdT8n4GrMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKc7QJIF37h3jBkPcG1fjLAfzoeytO1fLL3nk2/aeWQ=;
 b=n+SqariGS/FgG1/WTvmJrHKgZx55hoFzCFLT7VOZHX4cTgn6mBc/rLo+WqDbxoNxHvkzE/OmTNpwch5m2WiqKg9Y+FehRE7iDRPW06sKLUUs5Jx1TwsVk5HiHvVnrI9cFIj1gTyhncq5edm3sENDBVjb8TNSXQPOzlYlvk+XQUFUkybWKfhNtKymubg+2MjMndczFRYsY79hcuaTT47d17XiNmaPWKxcyRX5GdKuWthxioP1+sXmzIQX43P7uARXLlaOsDIVa2BB+NM6clGsrOcqqc82EefaYaCJn867K3bkt5AWeMJYJT1p9jxbgNy0FhLSCcKKuc81rE9v/mHSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH 0/9] IOMMU: XSA-373 follow-on
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <e4037580-4c37-13ea-7667-625a2211aaa3@suse.com>
Date: Wed, 23 Jun 2021 08:51:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:208:1::48) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 630de0e7-b153-4070-5023-08d93613607f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4148:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4148C19DFD98E0DCED79A8B0B3089@AM0PR04MB4148.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gLNW7YOiMcp47gfhc7l5Zlonxn7LbaMHwToUElyNrQb5VoLS9p8+Ua0IwfqklfRXPDCPY6DfwN0UGFzT6hDEzca+EHAyxSSdly87EWN/6yMFC7XOgTUwtBwRkjM12PPK5G8eGLuTME+JSkzrNi9sfXL8NcfAitXoQc7AKC/Gu145V9J6echN46VH7dRzZWVk85fc12wBIbnyceh1/0Q4dx9PlJf3jTiMZXZtlL8EEorwE2OyRmX0fdZkq0LsyGE9RahTt+4EuyNiLoVDxWTQUya2XHqHRsA5+EfLgDjZnfMzC4uG4xT2Mi2GuzNRscFPs1aBSL6ckuMSO6UrehlzvbOpTPzk5vV1nJ+dTzBcRF3qhtAQlPc2AC2wlkMglApne7WVkeIhdjyPVlteVkI8KfAlGV9SlCVsbSABlF4ncYRpJGlfPxk8DGB/cd/sy00LTizif/CWROz6iixjDjC6PtMi5hxSl7qUYZSRK/aexnnA4BeizEmMWONVcBgwfg7Z3AW2RqjBEjq+IblYcjhU7ZvSXIJUlgMxwKB+jghMIqZE+JILlgp7WSIyqZeN/+Kr2C0lY3S2e7Mte/l0AdmXo1shAOhoRzxpxqxKqKn1OiPowtRVbk/EoNqXXb8pyO2+iwmFDQiX4MlgMfgorirM8CPek4DxtxYAoYcrNa39FxIwZxRe5vEkfTW1x0rGXFY7gqfmt9izHQzXEJJ/JcpNnT5ZCQ0oVVDlZpKoxRfltzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(39850400004)(136003)(376002)(186003)(16526019)(86362001)(4744005)(31686004)(6486002)(8676002)(83380400001)(38100700002)(8936002)(4326008)(36756003)(26005)(5660300002)(66946007)(16576012)(66476007)(66556008)(54906003)(478600001)(316002)(2906002)(53546011)(31696002)(2616005)(956004)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anB3QWZYVVppREQvQ1M5N20xcnFoNG1weE5SL0FEbUFXR2ZIakpocE9xZzQ4?=
 =?utf-8?B?MmVGOEY1V0hQNERQS3JiN3d3RCs4TVVETXhRT0pmenR4RFc3RnpKVzRGQ29k?=
 =?utf-8?B?R2dLdTZLNnIwenJrSkNhcFFCcU9NUkdnSlVvTHJ2cEhGSXlhV3g1TDVEVEpz?=
 =?utf-8?B?Q0tSNXBCWE9VRGloUFd3cWV4ckZUd1o5T1hVMVBBdS93eVRGcTRzWXo3WERJ?=
 =?utf-8?B?bGlRcWV2WDJtbnZKV2ZPWHhKQ3U5dVN5Sk9GakZhbDRsQVZSSXo3cjE1N2Z0?=
 =?utf-8?B?VEZXeEswZkNhNUludHkvMjRDTU96OUFQUmRCM0xSbGxYSnd5NmNtQzAwNTJv?=
 =?utf-8?B?MUQ0MlQzRFhpV2tENERSUHMrcS9wbEpDaGpWOENXQzJzMTZkT3dsQ0tnUi9W?=
 =?utf-8?B?U1pjMlpLVkVGSnFkcDV1Zmx5alZGQy9aZVpoR3ZjbXFTNVlMRFFLd0I2UkZ2?=
 =?utf-8?B?Vy85U0h1aUlKa3VkVU45VmU5S0hVcjJQQVp0TFVmOHV4WW9YRzdOS3VWTkJI?=
 =?utf-8?B?NHVRMTZtTzN4NWJLUDhXbk52YTR4dWRsbXhUZjlPVEJsT1lxdEpac0RWMmdS?=
 =?utf-8?B?M0tNS1M3SFJkVWlaUndSWmtNWE5UQjhqUld2cERCZnVvN204MEdOMGR1WGps?=
 =?utf-8?B?WEMzdEJXWTQ3N3h2a0p4NE5OaFZpejFmZEsvRHBwS2NqT3h6Q0dCRUxYNWxT?=
 =?utf-8?B?bmgwL0pwbU84OVVPWGNhbDhObWlWOEdUQUdlVGtMbjBjbjNsU2RxZitXeGdq?=
 =?utf-8?B?MTBteTlEODZ4T01rU1JYdTArWEt5Zko1SEN1Skh2OGhXdy9YbXA0c20yTlh1?=
 =?utf-8?B?MlpFd3VXKzBTM1VKaEF4WjloOGxhNklFRVhFb1dPdkxsTVB6Y0JQMndUa1Rq?=
 =?utf-8?B?OUJseVJ6VFdnc1VhS3RHUnEzdEcyVU1XRGh6bGJVQ04zTXdTSjZxODN3SVhT?=
 =?utf-8?B?bVQwbHRWTjFvVi9yWFZRc1ZDS3BkcUttQWQyS0Naak80T2ZxZTlmZFFnNUNJ?=
 =?utf-8?B?cFN2MUI5MC9vMTljVFZCRUFWUnU1cWtkQlZoTXFCSGdzZXJDZ1pDWTQ0K21T?=
 =?utf-8?B?bWZ2b1l1WU9zY1hEOUJLR2xDVmFuVk9FZWl1R0pWbk42RDJzWkJpTEljUVIv?=
 =?utf-8?B?bnFrS2x1Uldpc1VSWVNMeE5KUEN0Z0M0MDdMenFpeHh3ZTlmRU5qTWcwcXRi?=
 =?utf-8?B?NVNMdHVDNGQ1dlpmT3VONUJMdjY4Uzd0NVZXNmdoZVZFMmxSMnptenk3bkkz?=
 =?utf-8?B?emVoRnFReXFwTDFwT3dTbThOSUxpSW9LNVVudndGbWxjR2ttZjU2dVNVeUt3?=
 =?utf-8?B?dnF3aHo3WVZ2NXg2YmQyb2tvWTg0bkUyemhaQW05L3N0SmFVaDJWT1QxT2FE?=
 =?utf-8?B?UTZQcWx3TFMxOHd6MUdhUW5pNkFEVFEySmhuQ3VpR0RBMmpUQVdMR3Rob2pR?=
 =?utf-8?B?QXhZTThyU2NvNWpPeDlCWDZKN3hVandPNFdTT1QvbzBQYlFVMmViZjM0Q3JI?=
 =?utf-8?B?b3hPMksya3VRQmVLVit0aHNaN1pRSElUY0pPb2xCOEplcXM3aFpPa0FCamtk?=
 =?utf-8?B?Wm1zWFZFZVFkMjRRMHlQQlZOenFjWjgybFMvaUYrQS9BQ3R2cWpSK3Z2bC9F?=
 =?utf-8?B?aUNHMVExL3VRdmUwaVk3V2RGcGhJa2tLQXlCbmwrUFJOaXZkbklET1Q3M1pE?=
 =?utf-8?B?TGlaYk1jcGhJUERvNUE2RWtnOTBCMHFsUlB2NCsyOGZtYWZ1SXJScFQ5TmFN?=
 =?utf-8?Q?Wj3J5jBF0VRooGyoUav8y4iWqpds9QqMyxIfJG+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630de0e7-b153-4070-5023-08d93613607f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 06:51:50.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMRPoBrTeIJXCCj0f7Mz+hPZf6cuHjnOxeK/5BzJSKX6hIHaymHpIybRtm2V9xhI/aNnoU+bmEnxLkKkqlQpqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4148

On 09.06.2021 11:25, Jan Beulich wrote:
> A number of further adjustments were left out of the XSA, for not
> being a security concern (anymore in some of the cases, with the
> changes put in place there). This is the collection, possibly
> looking a little random in what it contains.
> 
> 1: AMD/IOMMU: redo awaiting of command completion
> 2: AMD/IOMMU: re-work locking around sending of commands

For these two I have v2 largely ready.

> 3: VT-d: undo device mappings upon error
> 4: VT-d: adjust domid map updating when unmapping context
> 5: VT-d: clear_fault_bits() should clear all fault bits
> 6: VT-d: don't lose errors when flushing TLBs on multiple IOMMUs
> 7: VT-d: centralize mapping of QI entries
> 8: VT-d: drop/move a few QI related constants

Kevin, any word on these?

> 9: IOMMU/PCI: don't let domain cleanup continue when device de-assignment failed

Paul, any feedback on this one?

Thanks, Jan


