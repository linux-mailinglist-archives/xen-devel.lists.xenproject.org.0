Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AE6D58D2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 08:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517646.803303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaIs-0001oL-IQ; Tue, 04 Apr 2023 06:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517646.803303; Tue, 04 Apr 2023 06:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjaIs-0001md-EU; Tue, 04 Apr 2023 06:38:02 +0000
Received: by outflank-mailman (input) for mailman id 517646;
 Tue, 04 Apr 2023 06:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjaIq-0001kf-1I
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 06:38:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c90218e-d2b3-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 08:37:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6989.eurprd04.prod.outlook.com (2603:10a6:803:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:37:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:37:56 +0000
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
X-Inumbo-ID: 3c90218e-d2b3-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtIZu2Q2yiS1eXxPR8p4qTQcO8AMasHTE/9ow7bE2JzE9WRin2B4CzIHCzQ3dn49seQF93yIluSz/5SnLZr8LsfC/IYPdmydu5ikTywb0wEHnAJ6oIgbYod+D596tLwGBjZjjc2JSLOTUw1/OcfjufF17FIXwMpqIXdqErwDWCcdHhYY/rrQt1a1yaqBq/sd6pPBY4xYJiIFky1RoLI4fsBn1/Kek/wQrnQuu9rPwfqWV4ijmxdVUD7SWsz75PModVtK/rXHigvu55x+HmtMhSGFXN2cLufGqxCS7FT7BZMI4D4tP8wdkfp1lfugqKS+eIM+pzHPQSGpHoJVhwmGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nxbvcdtu2fDPhGz7G7bOIoBMTqBuVwAFgntN9b6L3M=;
 b=L3zGQgqXHKxubaXksa5ZsBYheFm8glh+C6YLBo2CSTzjpCPfF+sX5CntHo9Bnqrh1OqaYRxLtmJbVdgk7ndiRGYQNRvSLCHut+nUvJekwV7AbpncS1a6QJylBS+t74qC3Ez0ptZJBmlRvivpQMEk6CVycQjAOjbad49/lPidsLYIyreF6WE+xErkpSRUa94eBKc2ZLnUbLqiPJUfr6bfE4z7Mx3ip1JVV0KN7HvNcIErJ+T89HrkWmUT5wepUkIE1ghoubFXZ0gznBBShkp8IrMz8qcgT8LthIWL0vFdNia1X1hSas016wyChzxoi8BMcQmLySZbNRHJVIWbPIrAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nxbvcdtu2fDPhGz7G7bOIoBMTqBuVwAFgntN9b6L3M=;
 b=XPgYU6rbrxO2s5ejGWNdYXPnTm1UoGwHrf2q/5/ddhikhV1vqZY2vwOSSOQ5+3j3Ben9psC97oAKUB1wqCu7e7RM9+O03nai4f6sNIt7OuZq5iKgePIu7msA8KapVqVhA8r0P+nxHsgJvkmk01FyfduUyDVv/nYNfRejWWd4A9NZJ4Ye3XFkm7OEovUo8eb0FzI6OfAIyN8yzHGVUd5HczX/4bqyXJRDUn/fe/yWbyJ+T6sQ4eyZ9UiC5LfXqqRiCEzsttuT/pYJh1cjk/Mub7WNc/d99zI+YmKfGJf+oBoNT9Hi1NmSl38UPNhtg7ehBDfEMElx3+lELFqg6KMDpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <515bbf07-91fa-1932-1be1-1411f7814e6e@suse.com>
Date: Tue, 4 Apr 2023 08:37:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: drop bogus .PHONY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c0fabe-515c-4cf5-de33-08db34d72023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8v45MbdvZrr05/tp+ZTvzkDrUxuBsgvXnm9I25qRU0gXVrZ9yCmJVqYrossXYraqT2fefU3lC9wLsjae4u9TY5J1xH9lRCjU4aczaYd0js7EgNTivkWC8OKTAyldEFGbVmmIVM95nYXfbx9ILIDpkAw/bUnoCORcU1wF/XHumVA6rN1p4b18Jpyp0zwv3nOlULKjLW5bevDGf+yol7iKXhMVKFJXzjqUaHtkoZjvZtn8EKtqWEWDzDlaOo769WUsX8Qz7Q7N0QWEZKbUnXL1D5Uqsd+PJvZnlW4y1e3B9Y+2Wr831ymZy9hERjKFxI+eStTSZrifpFQPi8n4bgFynchUnKCHg2kQiJxhSjdVwwPGUmKJnvPHmTqQOl+gAw7Gyx4LpoQyoyR3OWUOtAL556XmuA1EpXX3D+y27j8Ejn+IoXGFEBXA+qG+a/U4WZCsDBK3xzZ2EdSlHCBCVCFqHiROW+e9AIfDpRUuG35qSj8EQAuHn8F0/w3SRZqTimjfDTu71J6IchC6jLhol7Iz3V1nkhYyDIVphOsd2Mi9NRlpFej7qE+6DXiRZ6e4LDAjI6mLkr7xiRJgdkbIDKQF6CBxhW61XOLR7rPEoXqLmkZ6T2fthjYyJ0jpgRUizjx5E2bLdcsoMqIjQUhEdcYhOi/7qLAKeKOz7orzqSeC3qisfAZaFsVXOwaLZrRH8KvB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(346002)(136003)(396003)(366004)(451199021)(66946007)(478600001)(316002)(54906003)(5660300002)(8936002)(36756003)(31696002)(4744005)(2906002)(4326008)(86362001)(6916009)(8676002)(66556008)(38100700002)(41300700001)(26005)(6506007)(6512007)(6486002)(2616005)(31686004)(186003)(66476007)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1BEK0FabzBqQTZDRTlmOHdtS2lDb3Q5KzhmMnBBajhOdXdvcG9jSEUwU2NE?=
 =?utf-8?B?ZE56Vit1NTdDUGZYT0FhcVBoWFdUWi9uK2t6dXdidVNCOG5CT2NpQmxPdnZZ?=
 =?utf-8?B?VHVsU3NCSGJDRUk0QkJjT29mMlUzeEVSamVVYWJPMDRYbFJnS3M0bmlzQTZM?=
 =?utf-8?B?Z05qVmNrRlAxRHZneHpTVUo3NitVaUp2SnVHcnJYbHovL1hzd0V2UkZObmIz?=
 =?utf-8?B?cHd6eWpNbCtQQlg3ZmVYU0VtYVRTOHNsZzh1L2VMaUFERkE1NjBlYXIzam1m?=
 =?utf-8?B?V2JsMktMNGE1ZUQzem8yaCthMEw0dERUNzhLemJBSUtqNVpWOUsxU3RlOHRF?=
 =?utf-8?B?OGRITTErRG5ESW5laDBaRGNiN1V1TTlRRisvVE5OKzJicTVWZExLbDErbDIx?=
 =?utf-8?B?N3hFeUI2ci9uenhrUW90c1VoUmZzRVpxSDhhOUNCaGtjc1RhZjJ1dWVPWkxh?=
 =?utf-8?B?ZFh2dmNwSWkxbE1kOTFkdUFzbC9DMDZOc21RSGxHUWorM3lmRVdaMXhQTmFC?=
 =?utf-8?B?UUxlZUtCU3dFVjZaMzNyU2VsR1kvdHNacVBXZkxBbnpRVytSeUNZMnpJcWVW?=
 =?utf-8?B?TzV2S2lKNmF4SUtFRGhsWkk4TzRkclZWUW00VE5nM3VBZkxiTExsdDdCZ0hW?=
 =?utf-8?B?T29SeEJyeVVaNTVRU1BTckJKNDk5MW5XVFNzeTZOcjdXTFp5VXN6aVhNL05K?=
 =?utf-8?B?bTRyK3hYSWNRa0IxVzhJbUpvZzBYcTZ4NWliTWxodUlJb0NRODBNY0Rzd2w0?=
 =?utf-8?B?UFQ2YzdCUWJ3QTBJR0FlckVTN1hvUlRKYit2ejJyditLQWZZRDB0QThHWHYv?=
 =?utf-8?B?UlFsOGFiTWN0UWVGLzBXTEN5SWJyV0pXR2Rvenl3WnFOUWp1Nm5SdG5DZ3Rx?=
 =?utf-8?B?cUhON1doSHc4RlZXUnVyeGxCcjlJQmI1NlBRdjFJNFcwb21VQllJQkh4Q0Nn?=
 =?utf-8?B?UU5XYW1Yb3dKQVFPYnJPN2poVEpwY2FOUlh4Vng5eWZac1A4UU1tWWNuWm0r?=
 =?utf-8?B?cVZvNFkzQkdrNXlMYnhDemhydG1qOERPekRHYU0zUVFaV0l0cmEyTVljN0l3?=
 =?utf-8?B?YWRuTThrUks0Z1FaZlUvL1NSL25DUFo2TkZJSG9jRmFGbkdGd0VPbTBJUEFH?=
 =?utf-8?B?Wlc1MUlFcGdKUG9WTmxlRGVsai9wVXNuZWJjaHVDTEQzdmtJU2hDY2h6ZGNr?=
 =?utf-8?B?R0xXdEV1LzlNcGs0NFd0UkJVeXk1anR3RFZOb2lqOXdYNXVGejE4RHhxNEtM?=
 =?utf-8?B?MnRKWUR3RnJZVk5LSFNWL3hjMDdPN2ozaTlLU1VxaEJicUJ6NGFhTE1Ia0pF?=
 =?utf-8?B?UDBkOVhQZmRieWNnKzhFTnVqUmVGbUg4QUVLN1hxMGFTWHNQb1ZxVmEyUlIx?=
 =?utf-8?B?Mjhja0RhVDNKTzB6bFIzbXM2c29IazR3V3U1eGxpdFprKzU4WFNXOUttNnZo?=
 =?utf-8?B?MTZ1NFgvY2tVNmxUSFVBbkpCNDFZQVU4RmZYTWlWQzFjUFI5Z250Sk9LaFY4?=
 =?utf-8?B?bllKYkEwUHR2ZUdKY1pxK1Eyd1ZidExlTUZjbEN2Y3ZUZ3RscnZxc05WOGNQ?=
 =?utf-8?B?UDVDdGZOYTFRNkV4ZFVlY2Q4SlgwczZZelRIcHh3amhFbldmOVNaMTlBbGJx?=
 =?utf-8?B?SjMrV3ludVBHNjF1d0szUCtmdCtvZGxLRldMSmY4U1BjNHgxWmRvNWpFS2FB?=
 =?utf-8?B?ZWlPNzJWK3doWjArQWUyT1pJUFpRTnRPZXFmT1YvZDdrbFBFL2N2QjVoZllt?=
 =?utf-8?B?aUxBbEJtaHpnWjQ1RXc3N0VHQlczVTFRcS9tVGo3bjZoTDAvVGFTUlljUmJP?=
 =?utf-8?B?UUZkR1IreDB3MmoxZ2JoQTNiYno5bWkwQXJxUnMvMnJ6ZFpGc1RqZ0dnNkg2?=
 =?utf-8?B?N1Z2c0QrQWgxRkUxd29LVytSbGZQbmc5bWFQeVVzdEFzTm5OUk1kRVNXbk1Z?=
 =?utf-8?B?R0RnL0lXTWRIYTBaOFBDUml3UDlHMmZCK0lDaW1xRUlnamVRdlpHVVZkYllL?=
 =?utf-8?B?N0VGaXBxVVlXL1BrREY4VXNnS1dPY1ptN01VZmtqTUZYWFRUc0xZZUpyaEc1?=
 =?utf-8?B?d0dkVFNISmk1OTM3YlNlazBqcFlGYTJhMnREeE9DNEdjWTlJTTIrMTFKU01u?=
 =?utf-8?Q?1EV/+1Sq0BdLMBGcwY0AV5+lx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c0fabe-515c-4cf5-de33-08db34d72023
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:37:56.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+KkG4e+DOvljm5O5UTrR5Wlwak3JMgdN6WCWw9TBiQsBTJHhXNdG1FKtPIAgrVhDXao+0thRzFhPfnML1Xp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6989

x86_emulate is a real (directory) target.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -278,7 +278,6 @@ else
 run32 clean32: %32: %
 endif
 
-.PHONY: x86_emulate
 x86_emulate:
 	mkdir -p $@
 	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/

