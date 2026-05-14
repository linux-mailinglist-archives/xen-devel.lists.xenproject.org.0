Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCiqLBXYBWqacAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 16:11:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D0542D17
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 16:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308923.1580177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNWll-0007YZ-2X; Thu, 14 May 2026 14:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308923.1580177; Thu, 14 May 2026 14:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNWlk-0007W7-VV; Thu, 14 May 2026 14:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1308923;
 Thu, 14 May 2026 14:10:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNWlk-0007W1-7e
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 14:10:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNWlj-00G35x-KX
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 16:10:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05d7c6-2eae-0a2a0a5409dd-0a2a4501b5f0-22
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:10:31 +0200
Received: from [40.93.195.18]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a05d7d5-c1f2-0a2a45010019-285dc3125a74-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 16:10:31 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB4924.namprd03.prod.outlook.com (2603:10b6:5:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 14:10:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:10:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9jPPpMU2JckizSZvbSXBVj+4rtOtPnM82hlr+nrYewe8/+lbHvJdbCebkrBzmcYOvLZgaOSW4Js0Ph6ufME/J9MC+I1IUMTeXTG/VDubBR+6cDlVLPQMQMA3MUn1VBwXaQDMIb5uCyCkJw0KT/XAfXnxjKhImaKStlNn3aFQv4JMpJ11Ss+XaQ5SwDLRIu+NIplVSLysTRARzuuRh4Qpj9d0DyAc7GSCLAVc+C0fmkeN0xgGktYZPbhwW7jVBsaaT8GTP6lZFVsqzEZMXyZfZvmavvVzVFTeY+45xPTgLI6v6RtCInNe3oROgW0JPz6U+re+ghu50NihzUnPfrpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdfll9wakSiG+LDQDic5BhqH8mPxHVudYeYjIwOKyZo=;
 b=OyzolpehMBOsfUpmZt9BAsoyK8+WpQwyTvbd4bg2G4hsBNCHX4hzsuzLTqoTOhLUp95V8d7Rrs/wrLnhRYjUP+yfMGzDMVxo8181CQe967Ut4ybLu/OupBO1yJZEp/k+um50hV3dVuKtMYXyPQCTe0n7gvqjYl7yXmV3oGHwPbudKNcNfzi3Mjdfo/5d/gwaBwYzhZ1jHRgu9OD1JH8d4w9zkevRllP0bM9zRYh0inHmTsV/c8WLn6QViqJ2xRVOk22RkyD6Z8cv6aL4DnOn2NUD2rjvn9cSXmGmjisk7lchOp7JbrPHa/z86gkQstBkQtJB1VS5QfjWF5iUWJXnVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdfll9wakSiG+LDQDic5BhqH8mPxHVudYeYjIwOKyZo=;
 b=GjyIkkO3hMIdDTI4WmUTG8PlqEt2fKctY5fT1yzWrDGlaqJBJtF342lyVAlglPqiAVVJaNsPsoTWkAUlBnKoghl8geVV+pkgTaaDfv6lQFA6VYyclLrSQZQbLnq0anQE/URtAslZB7LIJYtXd/xi2ogqrImXV2/qHTvzAu3KCDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 May 2026 16:10:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.22 v2 2/8] x86/mwait-idle: clean up BYT/CHT auto
 demotion disable
Message-ID: <agXX0LudaVNEh2sp@macbook.local>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
 <aa14f45e-44fa-4cfc-8c51-d48548d55f3a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa14f45e-44fa-4cfc-8c51-d48548d55f3a@suse.com>
X-ClientProxiedBy: MA3P292CA0051.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: d346ebcf-ef3f-48f1-fd52-08deb1c28c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799003|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FaVsxhUZW7iFjuWqjBlGWUQOJOJVipb8wQu38+zPdoDMtGs5u1ucZtKjMTiQWGuIpSJjWTdj8uMKaSF3R/CamKdnZol6bl44eeGPGvF1oGM8TfvCz5uQH+e5DYtrW15KOu0mASAgao5iaTiIw0rNshWEpTY3g7qMJKQsvCUXsseapnvV5uNcsQV9UXYElajSVaqf9ef9FTt5+Hr3EwAhAfe7kDbmFIJX89OMixdlhplZfpimh8EPWs1nIvCe5g35CT6QaYr4SGIxBC9Qt3PqEiKzpZJ9E9O0ZfH02WXDfhzjug3RJ+zhnHQH6QIxCaan2oQpkmjof6cwma7bQ9EB+I1F10kC15WSjkMzzjA/QU5V9Wg+0yYaH9dMzW/vN6bVkpQ4cM38wlyhlt2RD8vrt+5TSe6GwxYnHYNT9tCQh+4/m9DkU+U7bS94UAG+FSExjwX+UUyKqwBh8lWXbdkgANDeJ4itDAVgO0awx++FDr2wvATqRE1sflEvOIUWXipRl6rOU0Xe1W/qSPNdnSGHr0GpV8vJc1uERGz4g6wOH//WqNUe5ggQq7iC5nbHBKBvitvwd0zkaMjwCBcXq1hsgPOvrdYpsth5eeGT+pLLSZyDRh9TQ/rTw9EwR8F1we6TSAS6YtXzscUG9rEIgExSgxs3H4DK7KZnm51P90f2pcPx6p+nc1KTTgLcW0sZXtAj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW1LMktzZ3dIU21KaTBzenJsV3E0aEVnRzAvMUJNTllTeUplZXhzcG1tN2Ns?=
 =?utf-8?B?N0hZYzFXYU5QYWVZaEwxeUpzY2c4NGh5Y0hvdzVnSk5IK2Zqa0lMMGxaVjho?=
 =?utf-8?B?dUhZVmU4dzhRRlM2V2VJTFJXZ2xDMktMODA0UU5EVFByeHZQVi8rbmliMDNW?=
 =?utf-8?B?S2pzZnRadWUzV2JVWHpOZ01kOGM2STl4K29GVjBvMTBNQ2MwWjIwS3N1VGht?=
 =?utf-8?B?REViWlNSWitGOEgrMG9LTkMyUkUyeUpobXhYWjN5QnZYNzFCOE5aMmN6MW14?=
 =?utf-8?B?RXlFck01ZGRtRGNKM1p6LzY3Ym1BeWU4R2s4Yk4rQzhiRkhERlA5UDJWMEQ0?=
 =?utf-8?B?d0tiR0FpZ21rV0I1RVFvSE4zZmdyNitJR0dIcno5MnRXRXNEdzB5elFCSE5t?=
 =?utf-8?B?anJENDBlcGI2d2x5a2xpZWdtZ0hqQU4wMW9wc2xuaDdQQnViTmtmU01HOG9B?=
 =?utf-8?B?WTlyWk1pRHFOVzkyeVZMV2hQQWhVTVVPaHFoS1lwNk04SFR0M29PVUVXM3dh?=
 =?utf-8?B?aGNJaFNxVi9xUWc0QS92ZVR5UFNKOVhvSGVBU0VqTExtVGd5NnVFMndUL3dR?=
 =?utf-8?B?VHhJNTg2U2lSS3pSeHcyRjFqWmRwL2hoelpwZG1KV2UrMnVuaDA4L2gxME5n?=
 =?utf-8?B?eFN2WXl4ZkdZK0MxVXJjbUdYZXZIWmw1UGFMMXJqMHFFcnowc1A5WTlKUDF3?=
 =?utf-8?B?Uk5QTFVIbXhwY1U3cHQ1bUZiNkNCbmdVQURIVFBvR0lPN3lNZHdyenJWRTFH?=
 =?utf-8?B?ZVJJZVRBYStMRG1BdFRFdEtTY0RkM28zK0wvTnJ6UVpyRXBPd1cxdmZPTVFT?=
 =?utf-8?B?dnpRMHpVMWdsU3hWakd1SlZXc2xvY1A1LzFqdUVsMWVCNnNoa0pGZnNlcmZR?=
 =?utf-8?B?YlZXQldGbjlrOTR1V1g0dnpjZWtveVhucjJUSVUvamJpL2pqNDNvS09oUDh2?=
 =?utf-8?B?cGVqZ1h4b3gvR0R5elpPdmsvQm5kTSswYU5HMkp6b3JtTSs0Z2NGa0JjcEFK?=
 =?utf-8?B?QldEUXY0ZFhZRU5xdTg3ZTF6Y0FlbzlpUmk5TWNCRG9SSWxDdGZOUmZNczgx?=
 =?utf-8?B?M3NjbVp1b3pPbHo0YWRnaVpFYmc3NTRUanBobWhDZjhpQ3hFZG81cCt2ZTV0?=
 =?utf-8?B?c1ZQVThzN3JYMk1rSVBqOGNhdWVLV1REU1l6N2ZtWkdhV2xRTVdNNXc4ay9Q?=
 =?utf-8?B?b0V0RExCUkRSYWxzZHkrUkVhVVB3eVVrbDZURFFCSHBsZ0hrbnAvQ1NkRWhx?=
 =?utf-8?B?N3phcEdpdjA2Y3E2UnhUb1p4VW9TSHJMSVhycjFDRnE1VzV1K2pyNzVrZThD?=
 =?utf-8?B?eE92L3Q2Zi9xTkZwbXIyVE1Fb0VQdzA3UTVCdmZXdFEwVEFpSDhKeTdBZ0ts?=
 =?utf-8?B?WHRtcWhac201TFdSeSs0am4weFFVcElyMXBDVlVuaS9FV2lDb1FkWUVjbU5M?=
 =?utf-8?B?VS85dWNNeUZkSlhpVzJrZEc1RWZhVk5XNXNkdWVTVTh1YjlQRFlWUy9OVDAz?=
 =?utf-8?B?L3RlT2FSaCtTNlhGSXRpeFBlU29TRUp3RGFHRGgrNFVaT1NnUDBQTDkrQU0w?=
 =?utf-8?B?V2NJOFVEYzFBbUovaWtKVVlzSXJjemlJVWFIbjVoVjZubXk5TTlJcjVmamVE?=
 =?utf-8?B?M2RwOFk0Q295c1hhejBWdEgvOGRXY2grUUl6b3ViUk56TS91Z1dpR2NIYlBy?=
 =?utf-8?B?RTRCTTZrNVNSR3pNdmg4QmdFMGN2VGtSbGN0MjQ5bVpVT0FTQjRiL2g3SnpR?=
 =?utf-8?B?TWVlenJhTDhBL3JIMzRXaXB0bWdEYXpZTHkwTmMxSXRHNUxpdzUwNE5jc0Jz?=
 =?utf-8?B?VnNCbGZ4VDllbmxvb0ppMW0wNXJYRzFUQTZjMEZtMU80dlMyU3pWRTMwUUZv?=
 =?utf-8?B?N0l2UFFCcVNpcnp1TkVhWDE5OUl5OGZjWXc2S2NHL0R2UE9xbjFZMVlFY3Vp?=
 =?utf-8?B?SEFTVjMvTm16cXBJK0VxdzJFeGQvQ3ZLSXZIeVZ1T2pjUmg5ZDd0THlJcStW?=
 =?utf-8?B?bkpFSVUybkRPSitpWFgvMStFaGw4Z3hONDRDZUVrVzRJaHY3RzRjcWJJL3VC?=
 =?utf-8?B?NDV2eVFmNXRzNTRhbit5S01BRmdud3VpOFdwTmtSMXZqY2pMd1Q3bk5RUUhz?=
 =?utf-8?B?ZStTWHRkdEE3bGhBWk1jbjJSRWRNWkFhVlI1OFRMRFdUblZXQW1RekNDeTJj?=
 =?utf-8?B?WC93UjZTUFBCUG81V2VxYlQwN1NCckl4YjRVSURXczB5K0JYUUxBOW53L3pq?=
 =?utf-8?B?ZWY5MC9LT0h4bUhKK0hmS0lOSm8zRDZZQng3ajN5Vjl1S3UwamlIT2Q0Y1Nl?=
 =?utf-8?B?bjhiZDJTQ2k2cmlpeUhpVFlDU3U3Vjd6WkErUU96Vm5iWHkvWnR1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d346ebcf-ef3f-48f1-fd52-08deb1c28c45
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:10:27.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmb84NJwhd/OYqsL/hpCdDV+tQp/LN5eOFvZgoLvMqBBLV/ZVB0QKhRGK1VCL+ksygXn0SgbzIARw4hmqkquVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4924
X-purgate-ID: tlsNG-d62444/1778767831-B6D59FF4-71163587/0/0
X-purgate-type: clean
X-purgate-size: 1224
X-Rspamd-Queue-Id: 0A7D0542D17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:36:06PM +0200, Jan Beulich wrote:
> Bay Trail (BYT) and Cherry Trail (CHT) platforms have a very specific way
> of disabling auto-demotion via specific MSR bits. Clean up the code so that
> BYT/CHT-specifics do not show up in the common 'struct idle_cpu' data
> structure.
> 
> Remove the 'byt_auto_demotion_disable_flag' flag from 'struct idle_cpu',
> because a better coding pattern is to avoid very case-specific fields like
> 'bool byt_auto_demotion_disable_flag' in a common data structure, which is
> used for all platforms, not only BYT/CHT. The code is just more readable
> when common data structures contain only commonly used fields.
> 
> Instead, match BYT/CHT in the 'intel_idle_init_cstates_icpu()' function,
> and introduce a small helper to take care of BYT/CHT auto-demotion. This
> is consistent with how platform-specific things are done for other
> platforms.
> 
> No intended functional changes.
> 
> Inspired by (and description largely taken from) Linux'es c93d13b661a6
> ("intel_idle: clean up BYT/CHT auto demotion disable").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

