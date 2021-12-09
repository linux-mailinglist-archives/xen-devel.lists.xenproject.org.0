Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E239A46E846
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 13:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242994.420233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvIMg-0001XF-DE; Thu, 09 Dec 2021 12:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242994.420233; Thu, 09 Dec 2021 12:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvIMg-0001UV-9z; Thu, 09 Dec 2021 12:17:34 +0000
Received: by outflank-mailman (input) for mailman id 242994;
 Thu, 09 Dec 2021 12:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvIMe-0001UP-Sp
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 12:17:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fba7afbe-58e9-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 13:17:31 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-QkVXHt9QMxyHE_MUiuW0OQ-1; Thu, 09 Dec 2021 13:17:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 12:17:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 12:17:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 12:17:28 +0000
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
X-Inumbo-ID: fba7afbe-58e9-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639052251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0wqGv5muiHpfan4IS8sY0yD+VfuN7Aoe8pGuQvcTvdQ=;
	b=ivA2unleC7VAkPs1hTJ9iGA+EUwn2IifhIB+qLs+MgzeCPWf5UIOkxhNfQVOc9wn1/1WeG
	hfFDtddQKMmrESkldD3gAQD3oKUU9bUHYMcxxBf3xF/0yL2TwV6g5KGg29DbyZSVtttmwL
	Td9RIc37NrIK0d+BrO8GhKqU7bDAZYU=
X-MC-Unique: QkVXHt9QMxyHE_MUiuW0OQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEtnkwv5dNISx9xKP91UMBWDIvPy5Uc9XoTjR7GDbq7EGIhIzRlYBzXAIYQaGTjmhlExf5S8ivX6hme1cnyUA3DJcJNcU3KNdYYfF2yUEbzxIhBn0q+X841jNkoo+XfoKirTOpKY5qLecc8a0y3g31zAXPrMXY6WjbC9EzuCJ/MuH+8P5fNIMMrmtLfX1m4EL34RGH20Ep/SdT2/tgK/MfmOFJU9YaybUoVa79nTwCncUgCrwJMHjXYqcKiIX0o6HtGYCpVp+3ZCSiZRD1zTpqijH4Xlf4HcD++z9uCcEElHog9ENEw3PNwyV4WyKkUBRlyPt2o7VLCSeu5gprjv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wqGv5muiHpfan4IS8sY0yD+VfuN7Aoe8pGuQvcTvdQ=;
 b=iLDWTMzNxucrO6QQfictNAI6TWnQchq5kX9EDBMRa/61EyW2b9B6yMzAFIOsVGKCWDT79TzcvSmeRYalWoMpe12Tza9e6Y3k84xvGpdD8ViAkDf7pBaXs8RRON/DVvwGnjsbWCCElW0V9bTrrKG2bvCrHLcM9PqB43dKKBzkrQXqYiVB9ottW2oyyFuV4JwjH29/07e8Fqi6Le5rFIq1zabTcCFXhc3rRKo4F2p9s6fAbSRZdfhAhbqg5BOXILkyhfTjN8kmfyqCQ1OM5x01r9afw7VWw19AYpI3WGLQBWXOBdvhszIW3zY5+32Sb25kpoA3lfJYWgaHFM/ThH0aGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
Date: Thu, 9 Dec 2021 13:17:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Paul Durrant <paul@xen.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: attaching device to PV guest broken by your rework of libxl's PCI
 handling?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0023.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7547a881-d702-4d27-eec6-08d9bb0dde00
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038983C3C003AB92DA1EC73B3709@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hqTBrv4hL1euisiG+bHzo80IYkV5H2y9QqxVgfKfAD69R7h2RSy8txiWYSuJyW5cR1iqkI8PEouACKiEknEbvBkRXdPJtkgB53JRZWTRfG0kVWQk5Kupyuf/whqlUBCWjMC/B6r+MbnkEPB56Vz3PA+rZiJIn1TOPu83D6uYvv4YjdTyOyx7YkZqz8KPGkV0GYEOjjI5Z9RPIbvATpoCo8nAFg28kcbVb+eShGOtTa24cEBAVrkfLTK993vIaCNtY7GDpu8/7AS5ENpXO1Ulvqf9gREqh3wu1niQYwJc3I3awzm4qiXV8sidkxGGGEZStzxoTfAfNpfawQpzwsjFHlUuma0dyF7nkhxaqYey5I2COH9mKYfSlZsX/ynqTcJL2EAYSkEBlIJ/pvb02KfIJLf2Brm+hbImfmETlVouqS458p312uLO7QZQejcX0rENeAl7BV9G9wFu3M2ru4hPVu3ww/AkZ+AKsFBl0fMXMg2sM1KNIjAqQF+tFrLNBkUGrvI8pgSocrrcu5xyR28XmX1t9e3oAyXYFqLedEx9MsuY+DSf+uLOWbnaEBPLYPX4dRYuXVubvuP2jU80tUZleq+yF4Bs4O/+eX2/u8q2y+yOSDwyFJLjy9cf+lbOmC1Ek3qwVbxbep3oqijpxY0FFxk/9tzpWqZaUghjpIhfHiY0wZ/TsaiMUzH++MBDWCyHUG49+nSdNVUK5kQStrD+G2kIQ0TQZrY75Dqskl6HL9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(31696002)(6916009)(16576012)(6666004)(5660300002)(4326008)(54906003)(2906002)(36756003)(2616005)(38100700002)(316002)(66946007)(8676002)(26005)(66556008)(8936002)(186003)(66476007)(31686004)(6486002)(86362001)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck1kVkFZNkdPSUhQempERW5NRWZqdnh5NzZVaFJLSC84cTNFOTlVbVppbDhw?=
 =?utf-8?B?Z21Ia1Z6Z3pMRjZqNER1SENyVnVVeDUrRXE3em14NTRMY3lDTUhaMVY5cUsx?=
 =?utf-8?B?Q0o5eTV0ZmppT3RzbGtFdHBuQnVVdS9NY1BZTXJxR0NLSGwySzJVVVJHL3BI?=
 =?utf-8?B?c25yTnhjNjBmcHFQY1VKSUliNXdEWVNpNGh0S2ozemlVeXFEUFNicGxGSWty?=
 =?utf-8?B?eDRXN3lVcnBUVjlBNlVhOE94NHowdVVJNENqY3lUd1RCK1h6VGo3QzhTVW9o?=
 =?utf-8?B?ZllBZjV2dzhXUjhFdGFlS2xJSEloY28xeVh6MWNvNW5ZWUlDeHlDMVJYdFh0?=
 =?utf-8?B?a295SE0yMzFtVVlIL2gzSGx0UUIwOGRXUDBsdWlwNVhidldsRG80d041cWda?=
 =?utf-8?B?R1ErKy96Tmdwa3AwTFcwK0hNTzRoWXFzamljMHY4MzRRN1FRb1VDQTJwNjdt?=
 =?utf-8?B?RVcyZy9KcFNERmxNQ2FFLzJlWHpFQ0VPM0FzVEVKRHYzSDg4eGlxblpaZnhr?=
 =?utf-8?B?TWpqT1czNGhjV1FmeEwzMkdxWU1iamloejcwNjU0M0FIK1VTSExxUlZ0TDFh?=
 =?utf-8?B?Z3l5RXg5blNJY252OW1BdVgxMndrN290QmdMREtZV3RxRlZ2dS8zYStpa3VS?=
 =?utf-8?B?Y2EwTHdLM2JraCtwR0dySXFXaDlhSDlWdFpMNlJ0QW1QZytNbG5iTkpTK2Vr?=
 =?utf-8?B?SGRmUXpDRWpBYTlaT0VHbmVBSFNuNEwrNGVxNzdZcVBLSG55Syt6TFlPKzJv?=
 =?utf-8?B?MUprUnBVd2xwWnBTc3hjTjVaOFlkUTI3M1JXa0lETVJNdTlWamJMK2poMkZV?=
 =?utf-8?B?bzY4NklNNXNNT1B4QUhxaUdrRTRUdy9hVG9RRjE5aS9rUXQ1cXh0d3dQTHZa?=
 =?utf-8?B?VHFwaHdtMStoVVlNQ3B0YnF5RVFBNitiY2UvNWt6VEFmR2Z0dEw1OVMrVU8w?=
 =?utf-8?B?K0UwRzJhSEU0LzBSbSttazhmTU9qS1Z6S3UvZk8xWmFpdFU4VDU0OWN5UUd5?=
 =?utf-8?B?NHU1TmxrWmlOb000OUJKeUZVMFBQQk5RYmk4a1hoWGVtM3NKK1Q1Zm5GLzRl?=
 =?utf-8?B?TXBSRUN0ZDNxWEZnN3FXOC9xdWFIZWtwM3drd0NLbklrUEw5NVVKY0pTdmVP?=
 =?utf-8?B?RS9NUHNRU1pqZkJSM0Q0MkZxUjhrOHVwdHNQUUh2amFucTJ2eC9uQWJ0RWZy?=
 =?utf-8?B?Q1RwQzNrT212Qkp4ejJ2VlZUeHltRlZsWGhXc3dHZDFOUy9HMTBVWVBpSktR?=
 =?utf-8?B?N0FlenYvMC9TT2xGUHJSeUlTN1NmL3IrZlBGajV0SVZOeW5aV1Ezc3JUblVV?=
 =?utf-8?B?VENVSnF0Yy9NWFRHSHc4OXUxQm9MSVFzSld6RFlDaTVVMy8zSXpWb0FjYzU4?=
 =?utf-8?B?T2wva1h6Y2RqazQ4UTJ5ek9ZczJYVTdMSjdiZGxEd1M1WEtObDlXSmdGS1pV?=
 =?utf-8?B?NUpOVFBtVkdqTXFpR2o4Mm9xWGRVYzh5Q1FKdzd5YU9mdDZWNGlqdTJGOVFF?=
 =?utf-8?B?dHlWbllzdmdMNVptaTFXK0tmRmg1dnV5cVRkRE1Gd0R3SUEvQXZPcVRZOHJx?=
 =?utf-8?B?d01vSDJoUEU4ekt0RlVjejNEaG12N21Wd043L1lHLzV2YXdnY3pkWFpJMElK?=
 =?utf-8?B?d0dXbTYwVnpRVXFwc08yZGlRdGVCNG9lRUI3VHdwTWxFNmI1c1NTdUZsWEsw?=
 =?utf-8?B?REM5bGdrb2ZEcVl4QzFPbkdJQjhTT3J5ektOSFd0QTFJeHBGdFk4NGlOMk4w?=
 =?utf-8?B?V2ljVzhjcUVQdW0xUHhlcU9sUzdwRmFwZDdzMXRLUmh6UTZ6NE0rOHBEMVZq?=
 =?utf-8?B?MkwyZ0R0cUlyMXo1OGJnM2ZkSHdEWCs4R3FYSWlIQ21IQlMwTi9QWG5nZTZi?=
 =?utf-8?B?L2RQeUpkRUtBdXV6akxSd1lNSGJXZ2oxRUFGbEhWdDJYMGhxbGExb2todVcw?=
 =?utf-8?B?aTVHY1pNYUFUM2JCeVI2YWNpbUpzR1c3MmJ4bEM5M0hDZjVBclpDZ20yZVdX?=
 =?utf-8?B?Y05WK1FqOFRnQ3N5MjlGQ2JteEU2cVZjN0ErMnNZQUg3ZFdBYXE2Yk9uMy90?=
 =?utf-8?B?SVlhVG5hQmgwSUxRRHY4T1VsNGlvK1R6RzVjNVd3VUhuU21sWDVTVU5hT3lZ?=
 =?utf-8?B?VEpOV25rNk8vSU94Q0w5NFVRR3N6TnRHYi93M0tvR2R5d2hHTE91Z0x3OUxH?=
 =?utf-8?Q?LdhuWiz9PTonML0/wIMbSC8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7547a881-d702-4d27-eec6-08d9bb0dde00
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 12:17:28.4876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJNfr1CyVGUOB9Cr8+5ljHXhNlzSFCrO5FLM4z9Kd6gvTbg3Ar4N8WYk4qJN7Tv6qrlE2VHC/I/RgO9ksidDNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

Paul,

in 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
reflected in the config") you've moved down the invocation of
libxl__create_pci_backend() from libxl__device_pci_add_xenstore().
In the PV case, soon after the original invocation place there is

    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
            return ERROR_FAIL;
    }

Afaict the only way this wait could succeed is if the backend was
created up front. The lack thereof does, I think, explain a report
we've had:

vh015:~ # xl -vvv pci-attach sles-15-sp4-64-pv-def-net 63:11.4
libxl: debug: libxl_pci.c:1561:libxl_device_pci_add: Domain 18:ao 0x55a517704170: create: how=(nil) callback=(nil) poller=0x55a517704210
libxl: debug: libxl_qmp.c:1921:libxl__ev_qmp_dispose:  ev 0x55a5177047e8
libxl: error: libxl_device.c:1393:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/18/0 does not exist
libxl: error: libxl_pci.c:1779:device_pci_add_done: Domain 18:libxl__device_pci_add failed for PCI device 0:63:11.4 (rc -3)
libxl: error: libxl_device.c:1420:device_addrm_aocomplete: unable to add device

Since I don't fully understand what that commit as a whole is
doing, and since the specific change in the sequence of operations
also isn't explained in the description (or at least not in a way
for me to recognize the connection), I'm afraid I can't see how a
possible solution to this could look like. The best guess I could
come up with so far is that the code quoted above may also need
moving down, but I can't tell at all whether doing this after the
various other intermediate steps wouldn't be too late. Your input
(or even better a patch) would be highly appreciated.

Thanks, Jan


