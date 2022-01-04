Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4533483F76
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 10:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253132.434200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gXA-0006cr-9Z; Tue, 04 Jan 2022 09:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253132.434200; Tue, 04 Jan 2022 09:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4gXA-0006aW-5I; Tue, 04 Jan 2022 09:55:12 +0000
Received: by outflank-mailman (input) for mailman id 253132;
 Tue, 04 Jan 2022 09:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4gX8-0006aO-9t
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 09:55:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66b6997f-6d44-11ec-9ce5-af14b9085ebd;
 Tue, 04 Jan 2022 10:55:09 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-5pi5LyWoPsi4MAW4Ac9WiA-1; Tue, 04 Jan 2022 10:55:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 09:55:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:55:07 +0000
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
X-Inumbo-ID: 66b6997f-6d44-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641290108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbv9fqnfaL5XXdMMolfrJCYvhU+NIIwr8vrBlPrcgLQ=;
	b=nnmcE0LYhjPpRJra9TZIuxO51hIy/UTOP7WWRc9h0Q+VY0A6xwXmDvXC9l6+7wWryxvmXQ
	+4vjersG44aKeXle+EdzIBZXZ+Ri0Ys5N7cG9ueEQ/EqqDKP4mOzNTF/P2BbOs4DJYQEzO
	hsFsLR/vuYK7vVseA4Q4VsZGe2/u1o8=
X-MC-Unique: 5pi5LyWoPsi4MAW4Ac9WiA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIgFZkEGVQ73OMzYxAlVWN/IuZrP7fCq/w9bjTBYdeo6GNfEt4pNmzga563gvA+wowG3uvM5wgssmC1HrN8GjlE9vXg/eNR7yia+bdEoAvtaL3pDnPSCl36sZt231e1jE9jwt8NLDIHw0n8RtVSe3ZFjfW2K0fxdLJfvgtyVQhb73EEESYUYW/2mGwhWxEj943W27d5L+IZARd2J4bfKfF+BSq82n3gnAx9HMVtFRTDoqe6jQHPsTlhjMyf1Vt2suKvNXrrJsSYAnU1TUzH7rQzEVSv5stnG3WV+Dhcf9TGxG8/DSTSLdkfqrj7sa9B6K7E//ITGzZlu6gf73vuchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbv9fqnfaL5XXdMMolfrJCYvhU+NIIwr8vrBlPrcgLQ=;
 b=ApiICctH0ZDeoAhVAI7bDgfg2btasT0QeCxPMg4jIsXtlAGa+IGVTXUGX2XAN5K/wqDBtVycriMwCByrbk5r08u/FFy2eENiht0dcdKOMSzKHCc3Sm27ho0o41K/wvYRtctks9QLGU1UbArTRSQWOtB5amu1eO3PCSxuPphRdBg7WrcjyjdIMnFpo9UvtujgIO846kcCReCQ9l5mGHS+h7LG1cU52edH7tVSvlpLSPkINm51qK4MWLFlIGLjpJH2J2mIrXkPxtSWzueGFS07xj0uxd/afitVeUukQkRa1EB9xNQWZweIgZSbr14R6o0MDnvkj2kjTFlbr/c+rTdaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de04d294-bf6e-2506-515e-0b388a6ee324@suse.com>
Date: Tue, 4 Jan 2022 10:55:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Ping: [PATCH v2 0/2] x86/paging: address observation made while
 working on XSA-387
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
In-Reply-To: <61c1d38c-65a6-e150-ed53-b565d30c18c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e6ca80-2068-4600-0420-08d9cf6849b8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608A849FAE6AD9A7F39E171B34A9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kfZ8aAfz0nfbn42BwzSeOKbC2RcdcMAp6AB3TVtZucbf9azRfSI5bP5F/JxwL0vxRpgQJUvPdT5vOa+raJzhGrWeGE1ZMKZ8TzME41ygcYHHLSAS2+TLTEPrD6PM7i/4jNgNwnLvKMK6lL9vGhdbLz78KlDYw2krTRwFYxVWPBaspao3scSpg2sGNZOhS+qq6Ud724NOgJWKQxJ4GMo3caFj8BRxE6MQg7XMkZGJ5Fq5bns33+CLG9TWREvIMh68kFDu4ZjDEzkSzYlCe5PSrqdMHdFugXnHlGz/21IJVXj6GkXE86tHY2PX/DRTP9h7VPMof1GRRXEAqhA2/sT8486HGRvLI/JJt+NnNnSoYbFqqO6s/mxgyfMuaDrteuWviPVKJjlOBYHgjCL43fiR6lURYz8Ee7Y19E2UK5LU7i4a2gmUUP1Y+cDBq5cDyDWDoxdwa7v2mLc+750IcE+2BsxwSGglEPOQ8WVYBlgc12cKmGBMsG4saI2Tz27WNc+YpBcPa3Y4B1gnqO+xBFd/1majc1mMxy4kP2d6wt+YEvOoNls4uFnGvxqHBaVjqvehzy9qwKWdxnhnXR7lGpp9fzmRpCqM1EpwZApZsfDrO/9XHG3bukyDTAjB0cXRKs0BwYyv9Kkj4IMv6x0o5Oi9S1rB3quRLifXiHSo6PyhXqz8PAOR4W/qFt7vxElvasCd5pRIAwrUqWYmo1M/jP/nWGnrWsEUm8NLruuyWQwKpDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(558084003)(508600001)(316002)(53546011)(6512007)(5660300002)(31696002)(6506007)(8936002)(110136005)(86362001)(66476007)(8676002)(66946007)(4326008)(36756003)(66556008)(2616005)(186003)(31686004)(38100700002)(54906003)(6486002)(6666004)(26005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHpSQXR6dVZxcnNwUFBBYnRoOVhGaUl0elJvOEpHUlZJVFJxWTZJVVMxM0hx?=
 =?utf-8?B?VWxNSkZybnh2VDZYbGJGbERJQ2FDZ3VLR0VQc2FwSXJsTmgzdnpHRFNqTlhh?=
 =?utf-8?B?ZFd1eHFDallqaGxoL0t6akJ5NURRZTRaVzNmdHZoWSsybWNubHB3czVnK0dn?=
 =?utf-8?B?ajhCQTAxN2EySXgwTUZPSUF0S1o2NDVxZU5jb2ViUkpXcHhxZHpFYjcyUkdX?=
 =?utf-8?B?NjAvV0FhOWw5QW9JbE5YbGZpZlZ6UnRCTWo4aEVZVUM0K3J1Yk1xYVcwWk80?=
 =?utf-8?B?ZWwvNDRuY0VhOG9iQXFjRVJQOW95alk2aCt1dmFLeG5GaTNuOER3NmtYSkEz?=
 =?utf-8?B?VTN0emk2S2Zlck9LSnhpZ3JSdTdrRU1PQW5tTjNQOE83S0V6elNrN1FtOU5k?=
 =?utf-8?B?K1RvSDZKSWtzV1dlSStiNkhMZ1BudzRiZ2Q4blJCYytXV1pFOXp3VHJBR1Bl?=
 =?utf-8?B?MGJHL2VRb1J0bDZ6MTR5MnNsMnB1L0ZXdDhtUi92VURERndSakVaREhFV0Vv?=
 =?utf-8?B?NmdjNnVmbDBreGdMdDdmWXFLZDZJWVlNQnNhR0l6b1BucXZOazY1U25TQnl6?=
 =?utf-8?B?YzNpbFdwdXlJRkNlS3IrY3pQMncxZEZvcE1senRyWTBqR29aZWhEUDRFblFK?=
 =?utf-8?B?VllUMHM1ODZ4Z0h4WnI0SURnMFR0THJoRHU0ZTAzdEdHb0FEVEZlOWRtQWlD?=
 =?utf-8?B?NVNFZjNOZDVSWTRvM0lHODdkdDZ3aERQSHBLMWF2UUZVczNYekpLL2tsZFd2?=
 =?utf-8?B?NFJxMmJ1SkxhT0ZZR21yanNSb0JpeXRjRWVHN1oxeGx4eTB4cGZ6eEdjZUNv?=
 =?utf-8?B?Tk5leXFZL25GMDBMaWtBcDBRRko4NjVPd0ZoU2xGdGxubXpZaWZtMGVRQnlm?=
 =?utf-8?B?b0FGUzZjWk15b0I4aUdjZk05MW5OUU1ya2JvNUJiendCRUJwOWxBQ1creFI5?=
 =?utf-8?B?N3U5bjc5TDN6VG5saXpQclZEODZ6dzBKeTlrZWEwaCsvYi9VY3F1cFc4bFJY?=
 =?utf-8?B?UnhSYWkvUmM1eUJqOWNXZTc3Z3ZWUnh4ei9DUXJZL3psZHo2NkVUU09aY0I1?=
 =?utf-8?B?ZzR1WEQzaXdscEJodHNKcFY5dWl6emhkMVFWeEJ3dVlweURjbE5lYVV1aS93?=
 =?utf-8?B?bHZibGdremE0aGtaZ3VYZkZUYnJtOC9vT3I1RWNsMTQ4Q0t1cmlBcTlOeHVs?=
 =?utf-8?B?VExqVDZKNTZ4ZkVWSUNjTW03U0pxNnU0L0t2OEtENjc4NnJVSW02RklJeXNn?=
 =?utf-8?B?NnhBZ1dTWVp1anJMYzZ6Mi9lN0o0UGtVYWdhdk42c0hxZGpYaTczQ3BkWkxp?=
 =?utf-8?B?Y2lDOCtQbmJ6K21mOUl3MVB5azZINVl4QkExWEh3dGVVTVdWcWdPQ2xWSkdI?=
 =?utf-8?B?TlA3VVk4L3lDb1Vvc1Q5RzY0TW56L2ZqMklQbDhXZkhTS1RuKzR1VUkwQ1N1?=
 =?utf-8?B?TldSRFR2b211Szg2ZTg5c3ltTFkya3dqQk9GRzIvWENiTE9ZS3k2N3BrN2xn?=
 =?utf-8?B?UEZ0NGZ0ZnNaNWo0YzVJc2FGSDM1ZEJ2Z2NnZjFJSWFETm9MaFZtUUhtcjgv?=
 =?utf-8?B?aW4vUVo1NldjTlBMTDhBQkIxcEo2QlY2dmlzQ0RVVTJFRUJPbGRPSlJlTm03?=
 =?utf-8?B?LzZEMlhtTXZUdm5UL29PaGV3VFE0SjJsQU1qZ1N3OHJzK1Z1MDBsUnJKU0FX?=
 =?utf-8?B?Z3Uyd3hZNjNuMitORzBVOXZnR2s5RXZac2RvMnZ5VnFsWlMxVWNpbnhib3JQ?=
 =?utf-8?B?NUZ1N1pZMlFOSHA5MkZyVmczbnNNdll3eVpkc1loWjRqYS9udGpZcll0R3lY?=
 =?utf-8?B?NHJFbkRJN3dkWnZrTmlYSElObUcwUko5bExjRG5HUEN2VktBd1NwTXRBN3ZE?=
 =?utf-8?B?a0hQOTF6YUpCWWYxVlYrOFZSWlRFWExPbjRkTFB0b2RONXA4Mm8vYXNBVmNn?=
 =?utf-8?B?NTA2V0JyckpGQkN4aDEzV3ZHUGNkUWNGSEoxeXU5NlU3K1hWbDRma1FOaXFh?=
 =?utf-8?B?MkhmSmRiRkd2NXdtUzNFMXVDNDhvczFmekhnZlhGUldQcUNKbFBzNk9yUW9X?=
 =?utf-8?B?aWV4MzRTdnArWno4cEtCUW5Vd1FlMHVOa2FLeXp6ZFJLTTQxczg3K3FNWVYr?=
 =?utf-8?B?dVZ2U2tRbzF2TTFmSjdNTnpKcGdZNjJ2RUhpYlFjdTArYWhZdktHc3FYY09H?=
 =?utf-8?Q?9fQTyW6tYBt6kXTpG66vbMk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e6ca80-2068-4600-0420-08d9cf6849b8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 09:55:07.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zJ6k06pkeF5XXCIU6Bk9wFpe7+yGWpJZcHjYQjU/dDilAAYT0pc2n2JFokVWRIkaHQNRYsKtYTjcSb+q2wvjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 06.12.2021 14:21, Jan Beulich wrote:
> 1: tidy paging_mfn_is_dirty()
> 2: replace most mfn_valid() in log-dirty handling

Any chance of getting an ack or otherwise here?

Thanks, Jan


