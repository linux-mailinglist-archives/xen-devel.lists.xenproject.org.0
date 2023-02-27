Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC436A3D61
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 09:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502267.773990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZ5a-0003o7-BP; Mon, 27 Feb 2023 08:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502267.773990; Mon, 27 Feb 2023 08:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWZ5a-0003lh-8d; Mon, 27 Feb 2023 08:42:30 +0000
Received: by outflank-mailman (input) for mailman id 502267;
 Mon, 27 Feb 2023 08:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWZ5Z-0003lI-2U
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 08:42:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9a9ddc6-b67a-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 09:42:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Mon, 27 Feb
 2023 08:42:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 08:42:24 +0000
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
X-Inumbo-ID: a9a9ddc6-b67a-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgZ2xIuOPh4ru3/pDSog9t5zIxrL9OZTbiTB4AfciRgelIsjqjcLw7T31raqWHERJqEzplAKlnN+PLJ6+M0Q0zRZ6E5Fx2JHaXr/qKC2JwhK/atvfeXaQe5KTLDN2Az2A+6AUbTJK4VHCuul5n/y0pTQzZIUgNQxkgHkvAPJVww0b02XYLhKeTLJKDlFhbhIq0ptsamb0FyAvKljg+9FClhGOfSKQoLgdgCSjgi9MfwtQ9qPe7gY1A+hNxFUonJ+zdovxTHIAtcxZHxoBJR7chgmpBfvFmftEeTGJu17MmtAdfrODAbloUc6k4E6P8T5rIt+Mht/HyUU70VUDWbSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnqYGSXYntkhgVXCRW0NUps+KP9tf5XVkWsUniAf6rw=;
 b=eHRUIKv9zjVJq9UioYUZs4Q1KiluIwHbbeo83ZKC4P5mfO+FJGz7S+eRETDrakMQwtEFXwvFLEJQjHeb1yupjoU7T/V0PUvp/yUxzEyw4AOd0qqOUb6z3pi4puxesCQEQaHbsvG09C4NL376/6SmeMinAtiSh48gkFcyAHc6xIU512tajgkxQPq8JuZDBmWrWUCCZAH9dog/+5307Dwj0n2IqaawIsaDHFOP0OddCocApQyHTsoEB/Y2nxwBplGPXVcP698bcnJBSf8vRUOBO3n2MiNCjolkD5M0ZBGGOy0Q961qeUE1kWLmNb6+vq9WmsWMSvfpqmEt9fOwTKXF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnqYGSXYntkhgVXCRW0NUps+KP9tf5XVkWsUniAf6rw=;
 b=XLK755Z8nxXUEUDxzYumJwu+pEIGy0/qcAW3QackZr7DuKY1C9fulskh6RNus00lK5Dsg7XPFFez2KHV4eigBMPuAveiEE7qIB5aDeqR6M8E1KGVmWwxmqVlOcs40OCGJ6I6qZlR/0K8x+SXq9+RuARu7q/G/3dlz0jWtMqQARQ0+kSdItPxnXOZFEOtAPdj+y4RltUAYiI3kFiYolQcBa9jLvxNEQ8ma4QFt9Snkmmo264bjIIioKLF+5JuelLNTdDnXZhayCzOfyoKX/EmZ6i/TjsZxa2REOFGYAnrO7DOu70CtaTUKV5fCIqnpI6GP3Jdgrh3//z/h8+mysy7Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a66c333-51e8-6e82-9bfb-10d52164e96e@suse.com>
Date: Mon, 27 Feb 2023 09:42:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/5] Build system: Replace git:// and http:// with
 https://
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1677356813.git.demi@invisiblethingslab.com>
 <85a65c8c5cbd7cab3b9eb57aed27a59443c7a6ff.1677356813.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85a65c8c5cbd7cab3b9eb57aed27a59443c7a6ff.1677356813.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c604a67-bca0-4ff7-b833-08db189e8c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JQOZe8qblVEaWynUD84kUVLiW6TOpLhdzt7Klp+oSTVB00WLOVJm9a60nd8bhhFdR9z/00NSKVrNp7l3bql7r3X3kMSdBhnIXR/1U8/bx5VoyYcBCMj5Ac7iY680UwX9GSWUvj8eT0KNfsBP7ElusuSxT1X8yHFUTeoNqmeLpMCS7PV0ZQuBmooQfqfr2VbtNS7vV5Grt8c46gKQGmz522JAkFaAe99JrXUnFZwaK3l5t+bOINuaQzWFySZk3zcSZxaJbNiMe36e+PGHr82DwD1xPvgZK5h3jL5+Nb29TIUf1B/hBcoYm+zVYgd6DjyqA2rtVPEb9CnoFMqMlXXPyDSsJfmAxmPPWIkdaOK3VUy6E0pILM94Mhm6ga7P0gl0cAkIAsffKc7b+cV1oJ6iZ3wkZB91eblll9LxNohHWKTjSevb9UabTkz3p8Zt/Ox2P5aFdSRqh3Q4+N1YlPCW0VuGZqQ/ny4IBBkDTjmDJPerIq2YxmInW+M12EPX61g1uG2xJTkMXaifxPp0d1HelYs3kYkNW5zm9cveYshv8S/qJ7gvYxbD8ohFPZTy9EKRoDmWEVFMf/T9xv6S5jP1Yr1cK6qwVcsGEoEaUbJTBHm4IDGSdHAOIAdWV4Jy1DAO7BUoLg9pk4i/b6A4JBE6tszGIA4CrZ5ODH6MvQZBn78uVjKo5ihdkpsNNUw6gVmxjSZV0KyBl5qY3o7GpmZTy7JFcdZiUOVzEXDKVVZAgJ6LCNsae0UJGXct7RFY8sCy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199018)(31686004)(4744005)(2906002)(86362001)(38100700002)(31696002)(6486002)(966005)(6512007)(8676002)(26005)(186003)(53546011)(36756003)(478600001)(54906003)(19273905006)(66476007)(83380400001)(6506007)(66946007)(6916009)(41300700001)(316002)(66556008)(4326008)(2616005)(8936002)(5660300002)(45980500001)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRrQ3pHSGlvOFFpZVFrUXpRTFM0RTFHR3V1MjduR0NLQjB4QXA2dWJGT2Jj?=
 =?utf-8?B?SC9qT0h5SnUxQTJhOFcwZ1VWcVNZMHI3Y29FZSs0aTltOEhHRVF1TDNMY3hW?=
 =?utf-8?B?c2N3OVpPYll4elp2S0hoaG5sM1YwOGYrbXc5bUJ0SkRib3dINkNtMEVKVUVY?=
 =?utf-8?B?WGdtV2lIL1VtMkRUVXJ1VkptcHR0V0VXanVpQXFjZFdCeDFyWDM1b1hUT2I4?=
 =?utf-8?B?eENhRGhJY2VkZ25mZkRhdmlkazJmd2hCUjBMZ25LbGR2RFRVZ2lBUEQza1pJ?=
 =?utf-8?B?WjNKZkxjSUluRnhwL3BjWXE0K3JackFFVTBXZUxYMzgvdkl2KzNqTURKbDJK?=
 =?utf-8?B?UnhkWnJYVWFqMTlYV2JRTzA5c1J2dHZyVUZTK2tvNlY1RjhSdU92QllMK1Nm?=
 =?utf-8?B?RGZmRnEwMkJFdDViYnlNMVl2NXQyYTAvYTAyd1VzejAvWmVVSjRuYVNDUkFM?=
 =?utf-8?B?a2tvYW54YXliUUxQM0hFZktwS1R3QTd0bVgwRkdDWWxzRGxxQkVuU3NLUGli?=
 =?utf-8?B?K2xFQWgxeXpEVVpqL0x2V21VYmw5NG9SdC9rVnpBVzNHTGlqeXFCNGxVQkR0?=
 =?utf-8?B?bjA4NmZDRFgwWlFzZkw3SytvSFZScGxvYi9ta0dINmNiWE56MldtejdxdkY5?=
 =?utf-8?B?VHRHNzAybzl4alRHNGovM2xNbHNTeW1aV3N6T3hraWJoRUl6T3FMeTFtaEZH?=
 =?utf-8?B?LzlDekI1MEl5b0pZZjdiV3FiZ2pEVEdrYy8wclc0MlkxS0M4RG5qTDJ4b1FE?=
 =?utf-8?B?aVdGSUlKVm02RmQyZXdISnZXU0JmbmdOTSt3QmJJUkNWZmZkWFZubHZnR1Ar?=
 =?utf-8?B?RkNqeXVjZ1Z5eEpLVFVnc0hXU1ZxM2Q0UzA4LzdZVDVMNDRsdVp2bnVwTGZG?=
 =?utf-8?B?Zk9xZis3OVlkTHdSTG1qWFk3Y21wZks2cDZtT1ZscDEwM0pqdEhDQm96SEJS?=
 =?utf-8?B?ZUxQbzdCRzJSOHJ0ay9uams2SU9YekpsYVFHN0M4QmFUcWs3RmZtcVhEVi9v?=
 =?utf-8?B?NkprejF4TFZxM1MwVnBkM29lbFdQNXk5OG41OG1STHA3WTZkQjR3cnBDUTVN?=
 =?utf-8?B?OXQ1VVRiRHVQNWpGZnNXb0lwUE1OVXdkTlo2NVlIRm11N0FHdjBCbjl4YmJ5?=
 =?utf-8?B?ODYxN1FPSmxtYnVXRjNGQjlJTzgzb3Z6bUdFdXR5dTErMUUrVVNlMzQ3Y21Z?=
 =?utf-8?B?S2VXbmVETnM4aWJhRWRwRmVXRU1oSjNucHZSZEZURFBBNXI1Ump4Z2R5N0tz?=
 =?utf-8?B?VXdIRFZTYXlYUmp3RWNaQU9RN3JLYmg2OHFvVVBGUWVNem8vM1YyNVlMM2Zn?=
 =?utf-8?B?RjRiL1owK0FVRGhvbm5NNWRRcjNxM3d0RE5ocnVGTFJlS1ZDRWozcDF6SW9u?=
 =?utf-8?B?TVM5eFYrRFZiMlBGVVdqbWx4RFpBeTgxTlVKWHRsOHl6RHJ1Mko2ZjJxT0hp?=
 =?utf-8?B?RWI1QUZ5MGc5M2Y0ZElLNHZCakJubi95SFhrRWFDckRrMVdjR0VvbTYwYXc3?=
 =?utf-8?B?Rkg5Q3psR1lXNldmR3hsb1dFU0hwcmJNU0RKc05reEpneXFhQlNtaDQrcFNX?=
 =?utf-8?B?V1laRTdDcklhQ2NWdnNLeS9kZTZKekorV2hUOE50TzErOWlINlhHd0NLUmMx?=
 =?utf-8?B?dFJTME5KbGh5aHN0MEdJUVFRWGdKd0oxRkY4UkVNS3pkQWx6RjlweHZDeTRa?=
 =?utf-8?B?ZmdsR1VnOG9teHpHek5rM25TWCtVTDBKejFsc0UwTEhsVW5CVnd2Mm5LTW45?=
 =?utf-8?B?QjhTcmp6STVWTmRtaDZEcFR0Z2tnQ294eUJsZEdHRE16QnU4Z1NkUm5nZjBZ?=
 =?utf-8?B?bEc0ZnlhVWsxWDM4RnZYdTB1emMranQvNHEzQzVOS1NMUWxVTXd0TXJhQXIw?=
 =?utf-8?B?N0dCc0t6aWVKTkVyc1cvYVllb2pjQWFFbElYMVNNM012TTAvY2JBaWg1N1Jp?=
 =?utf-8?B?NGd0N2lyL0dtUEFjVkYrc0dHNFdBRmlJOWJVckRFdlBkTlBsYmZEdmZkTlN6?=
 =?utf-8?B?dUUzZ3d5YVgxbjlFeU9WZWdaVUtEVFhFSVVLVXJxb1R0WCsrREo5WFl5WUZU?=
 =?utf-8?B?ZUYyK1NabWtVSVM1K3JVQmhjcXl0N241RVBHWmJ2Zmg3WHZsTkFtUzJYTlBR?=
 =?utf-8?Q?c5RBb+wpyq9izhi60fzcg7mVW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c604a67-bca0-4ff7-b833-08db189e8c86
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 08:42:24.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q19I+tdUStZYEscH5plEfAJ1oug2N159XHbFBpkFcq3o61O1EZDSm2Zr0Ch5eq4FLCKmJBhztAA/kAlFMoDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

On 25.02.2023 21:37, Demi Marie Obenour wrote:
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -3545,7 +3545,7 @@ if test "x$LIBPCI_URL" = "x"; then :
>  	if test "x$extfiles" = "xy"; then :
>    LIBPCI_URL=\$\(XEN_EXTFILES_URL\)
>  else
> -  LIBPCI_URL="http://www.kernel.org/pub/software/utils/pciutils"
> +  LIBPCI_URL="https://mirrors.edge.kernel.org/pub/software/utils/pciutils"
>  fi

Simply replacing https:// in the original URL does work. Why did you alter
it beyond that? Yes, either access leads to the URL you specify, but that
forwarding (or however it's implemented) may change down the road (and it
could, aiui, even be dependent upon where in the world the access is coming
from). In any event, here and below, any adjustment beyond what the title
says wants explaining in the description.

Jan

