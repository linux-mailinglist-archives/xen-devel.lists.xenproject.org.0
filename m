Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723BE44648E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222384.384546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizlk-0002A0-BE; Fri, 05 Nov 2021 14:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222384.384546; Fri, 05 Nov 2021 14:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizlk-00027Y-7e; Fri, 05 Nov 2021 14:00:36 +0000
Received: by outflank-mailman (input) for mailman id 222384;
 Fri, 05 Nov 2021 14:00:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mizli-00027S-9F
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:00:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be2316c0-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 15:00:33 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25--4loScLiM5ufDGzMKc1bsw-1; Fri, 05 Nov 2021 15:00:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 14:00:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 14:00:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0320.eurprd06.prod.outlook.com (2603:10a6:20b:45b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 14:00:26 +0000
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
X-Inumbo-ID: be2316c0-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636120832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kyrwkKQo8PqQ6qsiek9v6gJpL5wetJ+6I5TmhJWjrg=;
	b=V1X/noUZewkEyruCeWx9PPtukb+O/nKfPs0mxrh5H+sHXkg1ccT7XHpqn7uE8ydledNMRa
	ugnpXSQc8hHHNZvwLGOwtirbBwm004YmQulaSbJpILl5Pk/hKtW6Wxp8In/FumwpCuJOCr
	SeX+4kBDaTqmdXgvCdvZpj/uyxX5v3Q=
X-MC-Unique: -4loScLiM5ufDGzMKc1bsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/YAD0wUQh0549UjDoeJQLX8qY9OhArl74gzYI9fDx6edZQhcCYtUs0EqFZuhDugTuY6aigBr16wveEhJEg0Zb+mac5ehBlRlbHXdLwY0TG2g4SVUdca15z1a0HHQ6kJOxRy4hxCQWZjHcAcgGWCXJ96TQE6jyVZnv6irmTpIMSnrW2Wxn/2H0Bd2KRy1b+PDWnBI1sD7jk310MsIIYLy94yNOWPNAC9Jgn+W/duu1z94wFXELBBzEUsqiYF1hxszNYFcJ7pRX2ByvyOyql3ATIc6VLqEf7/PNRK9WbR8aP3prE8t9AinH/R8+uJrK7KHsJG4yfypD4FFpmFM++eZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kyrwkKQo8PqQ6qsiek9v6gJpL5wetJ+6I5TmhJWjrg=;
 b=el3dk9EsB32vfCb/woTU3WJbHNUjhGHmjaDiqGgnyrq/KB2pxEt8Zbp0YBtI1GOzy8fTHLAD2PdX42Yep+moR5aNVfRT7PZfdpHxsJgWB5qhsqRTi5J7LAnM/EWOL9r/9qQ0iypw+WFCTI46u1uvUvy20gl0/AGmrGzmuyCAnSwXEekVFOXJQHFnuAAbpfd9RxWwxFKbHufYXDUc0Nrdsv7xICJjrdI6oFlFw9gsIVJaOkDQHSCkU8M8whO1vw0AGKTOg1IlF0GlSsnpdHfDgboVPGrIjJIwyES5Jwj1HyHx9V2wwAs8QPDUs5swf7qkyiDjCnffKYRiE4iUll3l+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddb80a49-3704-8b30-2bd9-180bc58f6f9e@suse.com>
Date: Fri, 5 Nov 2021 15:00:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] xen/xsm: Complete altcall conversion of xsm interface
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
 <20211105135555.24261-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105135555.24261-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0320.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63bfc805-7340-4f3f-a767-08d9a0649ed5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590424F0D3176B5A6BB611BAB38E9@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	euSOQwXgxCrzsqsYC7njl8L9AgcW2TxmQUzLeLq4xuk58HukcBr7QjLEPRmwkXczoiv8W8oiW0DMgwmBs3HDaEUdfCKQ/H7gQ682tS+0coKO6wMUKhr9z0gi1ZXmL00EBm7MnzDHqLskHgG4j6DJSRL5e5latiubpNCpMQp2hrjFFQehyxDqALno6Q9tbyFEL+NP1jmv/Nvm+8ZM14UEX7b8bw+nMmiPiVbx7XZ+DlBuYSeqDoEuPmI9YJtropMMPztS9bKrx9sWDr5YCNR+qUhLSlFtHEUxGkRedzvu0SpyFXrAN8mtBOgH58lbRh996/yVZdVDcCqbW+ZDxJfu9YnwJxGgXYDYiSTpUoVC4ztiJ6ln4TMmJoH7MiGcoO+R97TuZdiBc6vUEy7kZFy4Bn41OVYW3DWYuOYsFO5/GNfl1blQt/ANuRemr0GRLVHigPgo43vVSWJySZWj5yNFQo8Lhudigp9fnommYXWfQUfIPR/iyt6eQrgJohKNH6sWgCPi4pmec+sbRu5xxz8cYE3eWUARJi5NakuWA6VARc/mXrZMMbHQhVy4ZaR4M4Y+SwQuxnKOMaT7dBJ+S/fYgqvTkJkRihGlr54kfvCuKLFb9BdOlYeC/j/FblP23dUyVIDvycmlxbCErwLOLuymlEDCOriUZ3NmkNW3W8oVlV27rauM2lWF6Y/RtwKCvbGc8KBoGo/UD6lhBeRKUTc2sIGzRtr0OuYBxMsOAjGhCVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6916009)(36756003)(2616005)(558084003)(2906002)(316002)(16576012)(8936002)(5660300002)(53546011)(54906003)(956004)(38100700002)(66476007)(186003)(8676002)(66946007)(31696002)(26005)(31686004)(66556008)(4326008)(86362001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVZhNHVWanJoTmRoaUljZXVSMjdFcnh6K0tqMzVsZ1RubVJYaXl0dmpHcmlM?=
 =?utf-8?B?TEV4SGtYTGZNYzZMVHhTRXhLUkdmRWJSdlJNbEF2SVVnWFpqMWpBWG5HWnp2?=
 =?utf-8?B?U2c2NmgzZWt6bjZBS25INVZVQ0dyOWVtZGl6QU9tbU5zVEZMK0hoTnFPQUhD?=
 =?utf-8?B?Nm9BOHhHZDNSaDRrTmcvLzFObjlwazNVZnAyR25XYzhGYlhWcldLMUNBU04y?=
 =?utf-8?B?enEraXlScGRjTXRpcWtFcVlpdlBLcHNwTGF3bUxNUFRFaFMvUUZ4VHhWOVdB?=
 =?utf-8?B?RjRGcXJWUWJNQVlpRjRYYVNWYWlUcEZManpwZkI3dUFvQ0ZqY2VweDFzUFBI?=
 =?utf-8?B?WkhPYklLNTM2eUMxUU8wTFV2bUZYem83WmRFa3RtQjVtVzNEaVRQNEVQSHg5?=
 =?utf-8?B?c001YmsxOHFHS0Z6d1JleDl5TnlqMXNyeEJlMG1EbDRSMlBJb0JqWkkxRnlF?=
 =?utf-8?B?ZDFYU3cwOW5qUkFydDU4V2xld0U5VmMwRGRoeE1LNyttaGE5cTlLK1VlMXFN?=
 =?utf-8?B?NlBVUWF3bGJweCtSNFBzUkJ4R2YvOHV4SEZtZkJwNWVGMHk0YzhxUVBDYVhO?=
 =?utf-8?B?WXRqa2p1R1pFeUJZMi9GYk9TRE9vRmEvSjNoTjhkNzJrMUNVS3I1YlFxT1Zo?=
 =?utf-8?B?b0hqQ080VHZBa1V3azA4WEMwa1lldE1pZUoyMmVscmlZZTZEdjdSeHZnTDcv?=
 =?utf-8?B?bS92UGZsTkxlYWlVSGJma3pEbjRQU3hya0xOdWMxcnNOVXc4bU15Y1pyWlh5?=
 =?utf-8?B?ZnBRN09BNVEyWVhlS1ROL0pwdWZTeU1jb1lxdGM1MTlvby9SQkxqSVZhWHUr?=
 =?utf-8?B?aEZPbk1KT0ViZGFKT1FSNFNjcnh1UXBVN0tWaURNelhZc1R4STVSc3VqRjll?=
 =?utf-8?B?M1VmQXQrR2Q1azZ4azVXYzFnOElEeFlyZzNuYVp1SnhGazZGb1ovV0dsYzFw?=
 =?utf-8?B?bTUvOU5JL2xDSzZPVk84K0lDU1ZKRmZCSE1ieThRc2hrYVQrMjFJZTliMmtx?=
 =?utf-8?B?Y3hSMG5DcGYwcEJ5RDNldTZ3Sk12bDh4TXRlbW5tZjJLU29wK0s2eFFNRk5X?=
 =?utf-8?B?RDR1ODNiUzJsTlNsbHUwRU9ucWNEN0grcjVuZDJKTkNVenU3U24xQ05GWWtZ?=
 =?utf-8?B?dDQrZnROdmpneTFvMXlMazN4Z0YwSUlTOFprV1BYTnRkK04zQW9ic2M0NzFQ?=
 =?utf-8?B?ODI1MThaRnZzWkNaVUtibFdEN0pCUFpMUWVyT25yVnJVSzRMMmZFbyt3a1VR?=
 =?utf-8?B?bWxDS25EMStrajJvQ1NnNGw0N0dDVG1WdWNmRTBNY0NQVE1pTHdMU1hxdjk3?=
 =?utf-8?B?dmpGbkVWdnJRcWU1ajhRc2luQVRocGhZamk1cjhHakxWeFltWjRyUEJhZTBy?=
 =?utf-8?B?M1RlODI5ZVdEa1Zqb2JQQVNma2tzZTJkOHJ2ZHRhTnBhemJ2STF5azJBYnR1?=
 =?utf-8?B?dUFnVzJMNDB3MXZrZHRBSW1qWGhacnh6UDd3OTRMSENuUXp3K3RCcWlBK1U3?=
 =?utf-8?B?WnF0QXd3ZC9TUzFmMGYzaGhEUFpUSk9pWmxBYTNtdzdGNGJTWjJlT1ovdFA3?=
 =?utf-8?B?OSt2eGswODBhanNRaXRDUEd3TlJkQVYySmszWUkzS0Jvam5Rc1hYUUliUDVs?=
 =?utf-8?B?Ri9LemRVWTRBVXRVZ05iL2wvRHlYU09BakpBdTIvQmFoaWh3UmdUTUM5NmFI?=
 =?utf-8?B?b2hsaXYwWlNEbjdsUWpLL0dqTmtmKzNRSHJUamdnTG9ZM1ArdlR4ZTJHZE5j?=
 =?utf-8?B?SW9BV051YlBnck9OYSttTFFPb0U4YnlXdEVoY3Zja1ZlT2lZMXorUjFWVWVm?=
 =?utf-8?B?TnR5M3hpVDdIcDFZdFhzMnE3OXNqSHJhZXU3ekEwV21ZNVo4c0thc3hId1JL?=
 =?utf-8?B?M0xPY2pubUpwWkR3bTdaRVNtempXNG95QVd1ZTh2Vk1UbDVmdzRvZTc3SW1E?=
 =?utf-8?B?SFlzWWJLNGRDcEluenRiRnlSd0QrWVl2bGdLY3ZxYWZCZ2J5Sk5pUGVmbEVU?=
 =?utf-8?B?UkVoRHdoMVdVMmQ0N3ZJZWh1UkM0MllBRk5xWmQ0WU5Ed2tqME1NcS9SMk1T?=
 =?utf-8?B?blFwVGZ1Mys3L1lCK0t3SmFybmVLQmhFc1lwazZBNEZZMG5LUnFYZkc0VDRR?=
 =?utf-8?B?dW1jMittVTdNQkh4TDM1M3pKZjQzZ2kxR1JyazF0emNOZ09DZ3hSSVhaSjJE?=
 =?utf-8?Q?JZZOF2JqQ412uChTgIudaKQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bfc805-7340-4f3f-a767-08d9a0649ed5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 14:00:27.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XjyHa2YK7L+4UfZQp2RsC5SvMQJq0WkmlQrxQEN+O+fU3aCAu5fG3V93j+PWZVCPZ0kidp1KxnPI4yX1rSvWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 05.11.2021 14:55, Andrew Cooper wrote:
> With alternative_call() capable of handling compound types, the three
> remaining hooks can be optimised at boot time too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


