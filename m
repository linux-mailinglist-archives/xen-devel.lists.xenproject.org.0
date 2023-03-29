Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6926CD9A9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 14:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516270.800133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phVGx-0006Je-5W; Wed, 29 Mar 2023 12:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516270.800133; Wed, 29 Mar 2023 12:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phVGx-0006Ge-25; Wed, 29 Mar 2023 12:51:27 +0000
Received: by outflank-mailman (input) for mailman id 516270;
 Wed, 29 Mar 2023 12:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phVGv-0006GY-UU
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 12:51:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 680fd8b4-ce30-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 14:51:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 12:51:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 12:51:19 +0000
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
X-Inumbo-ID: 680fd8b4-ce30-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3fgq/nmIfYSDNI9Zb+VIJMzSFZBJXTSL+O/O/5ino2hKqE6+pQgGW25d0o7Jap+j0xkGcOHqzcS8zhsrReCLxNH3WlqoF6ltvXFw26YARF7Sx06aeD4h0l3bWD4xtODKGPr2ILyHLu6CErWulST2rh4koafGAvLJfrAnOZNaKuxzX2MXEC7NfdvonDMIicAqujbfu+6l5jBZ2WhMa1ol0Ac2tPrQeyVyBnAONoR2/puOOpZDTmdoyTOs/6uhYKyYy5joz0qSHmfUxxcC8WnnLLC4WiG2EVVV3wXOSDMoz+4MFPgPaadjauRfSqtG1Db7qcSNUtH39mjHJ4Jg73L6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T39mK3XpB8Qy8WK3dRWFWUJy9x62EEydfVSESKViGg=;
 b=llyTdefLIRIDiTlRSebVjC5D4vVYQD0z6+FLxseAcCO0wx2Rd4n+I0IPlNq0SdUzNNGEgqt1GQwMwFzIFv5ULKhEaDqvBq9tl9XWxRs/sj+EKZZn+9ZIAfFOCVUQDKNPKyBadzMDudqALmLf+39aZj5HwtGv5u+CjoD/QKAE5Xp7WpOPDDrKinK9fF8kB97G4ahJexOHRy1APv0SQOoVzXeb9peGBv4OWaH14+GIaR4ARqfYXiXQfOSdrW86Ob2IwGsZmwme/biN0sthiFE+/zYaH5kB2jhGQ9BpRP94rQQBpgUZ2hz2ELoiPB+xTRQzbGX0AagCKSgyUcjag7abFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T39mK3XpB8Qy8WK3dRWFWUJy9x62EEydfVSESKViGg=;
 b=r25B1oHOqyNtso8q2HYddFLOwSDn96PNLfNmU87YNK/8y4hntGwREDHPqmRk5z4pxXnCJp3PamgfJVwctD1uuQI9OvJDUwCi9E3tu87FaQQ+qyKpK3GQEd6Hzz/texp16Sy7tziD8a6ay6a1U6CYDjlZ/dp8cFwPldAZu5Zu1onp9hO+p8IWp38noT1K6NN9aysK5rlzPak7LBHsfQWbIcjdBPdDo/y+CtJpdL/NtOfVOHO5t6VRi1JWreuVVu9BDtQe4cEjbJx22sNfovw9kBWF/RZVC6ZTH4jY64gznUxWEJJ5NveTI0Fz5xZg9MgPefL9qalsM/305VZ9keKU5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b07d8fb7-c99a-ecec-b69f-6c8c4cebdf5a@suse.com>
Date: Wed, 29 Mar 2023 14:51:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] vpci/msix: restore PBA access length and alignment
 restrictions
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230329101810.84726-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329101810.84726-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d787569-de2f-4bb1-60d1-08db30544ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FtYrR6CThIJwmrt6HHsjy0E5w6Dza4WCNlsMRN1AvLpTzdFZPt5mcKQ63Ro/q7KwJ6/8JLtGVO+ZxgkEkClT04o+83FAqesvS3biQmMlD0NdEAhlV6sdQCxP6Y1jOdX9+BSVR8EG0a9CmXT3OjL3LC/TLx7bPMRmFBgtT7nGA+Yn9Xz+duldYvozMpdNfPoCYpWAoQJoR/v0DUcXQuYKK768paOpIbDnQPJbw2oYLNMQYoTLqfktK3y+xhhUURPB5Q9n13xBZ05SjIQZ2wqpIoE70Kj2mvkZwHl/WFih5cxY43wm8fRaWqCTG1lDA2zbX4NdZXOD/UYrBTZ3RUJ9iNSfqFuYkdPNvXYnKv17zor7GRycU5GhA9UdD+ulgxSSDXVtdGGovbQZ301rkdfQGoiL4PyYs+IFCnkPDbmpIJIazy9eu4yYlNBn+hGcK1QwosxGaPAQJSeVtfWYxzozcD40b7YxkAJNwXn4ZnJwyHBwmwfKoWXR6aAF0GOXr06J0lyBq0q034Y/AyWoXdZRs4WQckT+jCyeZp0oa+8/anEGk/FqWqIW77x2tmTw9VD9Q+uduR7Kp9Y1cxg/GMkqrkiXi4kpI8Kic/p32Z3BiIwGBYpSf09QszRKPtB6n6mMaT71UrB8ErAsen0gQd92TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(31686004)(83380400001)(6506007)(26005)(53546011)(478600001)(316002)(6512007)(36756003)(4326008)(6916009)(66476007)(66946007)(66556008)(8676002)(86362001)(31696002)(41300700001)(2616005)(38100700002)(6486002)(4744005)(2906002)(5660300002)(8936002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkxPNlU0OXYvOHgvWWJuMXlkZHFjakJhOHRtLzJmUENJTHo5QmlXM1NCczVF?=
 =?utf-8?B?ZFJDRnJjeTlQaFVLdHd6cEhsblZrZkF4Z1E4YWpGN09Xd1dIVXpIYXFuVlZ1?=
 =?utf-8?B?cWhDLzErMnJDL0ZETktVS0kwWXF4NkNtTEM0SnVDK3RmcFA0MG1abXJjV2dM?=
 =?utf-8?B?cFQ0MG1FSHJ6V0VJUTF1NEFxL290UDFLN016SFJDdjVhcEJSU05SSUNpclpC?=
 =?utf-8?B?aE0vSHh5ZXBObzAxRGRkamxtenZxTTZiNHJINnlZWG54UmwxaEhVRkNNb0NS?=
 =?utf-8?B?TEM3aUxSWHNpUy9rWTc3T0k3cjZrTmtIMlNySmppazVjMjRVOHYyTEI4eFV0?=
 =?utf-8?B?eUc0WDhBWXNneTI0L1pWSGI3dEkxZG4xamZJR3c3bzkvbVhxLzQxUmVGV2dx?=
 =?utf-8?B?RXduYVhVVVpFN0VEVzhBMXBvZ0lOVFNMNVlRMWxJdzI2YkVjUUIwMWMwOXR3?=
 =?utf-8?B?bmJ5bHBueDlqNjdIZ1lHQTEzUU9ZOUJ2bTk1YXdxMHFHUWx6NVY5am5LRDRn?=
 =?utf-8?B?cEN1RDhiQi80Q3FGQ0FISHRqYUtRR0QzVTZzR2o5a25nZ1lGNWtGL3FYTS9L?=
 =?utf-8?B?bTdZeHlYemkwNjFQbC9FcndWdDFkMGc1SzhxTzlXanlxSi91MXFCOFFoUVha?=
 =?utf-8?B?ZHVWOVdZVUY1YUx5aTFpbUU3RWVrLzlEVUNqdVFjMFZJdklCWFVMQXdxbW8z?=
 =?utf-8?B?ZjNLUlphcFBqdnQ4YU9JeERiN0JKVndEQ1NiS0UrMW94SXFqRDZSTi9MVUdt?=
 =?utf-8?B?ZFZMMXgxcThJSzFRa0pMVDBIU3luVHk5dDlKU3VyMlFISXpvZ29jS0VHUEVr?=
 =?utf-8?B?RTFoOFhrTGNXZjEwb0ppNzR1RzZkaFEySWRtRmxFMjNJREZ4R2F4Yzhwcitn?=
 =?utf-8?B?ZlF2RlFEamYyWjZzcUJmNjlXN1V4SjdvTjRzcWdBTmlHbW9YckNJczZwWk9w?=
 =?utf-8?B?SmRyazQrc2lLbXUrYU5lL0dOa2ZKeVRXdjRWYVBBWFpYNnpicVdBZ3V1dWpR?=
 =?utf-8?B?U2RjRDBsQ1lWUzdTSW9kb2lHVXNxS1BlOFd3NnVhWjZTU3lBM2NBYVVVRzN2?=
 =?utf-8?B?SFh3UlhVb1BmS1Q3dVhaZm85Z0ExZ2djMTl6clVMSExTN2RUeWdSK0VKV2oy?=
 =?utf-8?B?bkNIWStsUjFZc0ZjTDJ3bldxUVlBOHpXQjIvc0pIKzAyK2lyenZkUFgvNzk5?=
 =?utf-8?B?T2t6TE9CK0pqNDZMUklWdWx5RVRqT1FuaW5CakFiRmJWbWVHSjl2dTFhcTAw?=
 =?utf-8?B?cFdHS3MvYWhMK2RNeFlsakJrN2pubDBQMWZvY3U4SHE5UlkwVktBMlJ1NHhX?=
 =?utf-8?B?R3g0ZWNzb2J0TXFublBpYi8vczY4SnVJUmcwMEhya000cWlqL2dzWDJxSlVN?=
 =?utf-8?B?bGR4OWJhMExObHY2ZjhKS2p4dnRyV013RitNNm9sVTVPQk1KejdSalE0Z05H?=
 =?utf-8?B?Wmwxc25FU3FqVkFMNmNsYno4clRMSDFGeW1kV2g0NjBudm1oV1BqR3VpOXpv?=
 =?utf-8?B?RWVLQ3kzYlhtYlhoVjNZVjI2S2IvcVZVejA2NVg2M1FKc0M3bDdjUWFNR1Rm?=
 =?utf-8?B?UlEzaU5RMXU1Vzk1ZG9CV24rWjJQTXlrZkVtTG9Eck10RTgxeEFURVh5a3l4?=
 =?utf-8?B?bkdReXJvSm9kaEc4L1lxNXlva2pGTUhOdGROYXlFMUZJZldwcUNKTjlCcWVU?=
 =?utf-8?B?VXowdWZ0Wmx1aHR5L1RMK0p4U1hBVWw1aHFEdDVFMm9MRVpxbnd2VFR1Slky?=
 =?utf-8?B?WmVoNmluWUh2cnJ3TFMySmxMQ0tXSGIyaU5hQ0hnTlY2KzhielBHdzZCaW1I?=
 =?utf-8?B?R3h6YUR2d0t6QmFRL2djU21XQStmZDROTExRWkV0Ylk4Q3l2QVlTUU82TkNT?=
 =?utf-8?B?QU5DVUhrbEhVRDlzLzJuY2hBNERNZnJNT1c0RlY5dCtLU2VzYktabmI3NHYz?=
 =?utf-8?B?V04wYS84bzkyQnlWajhydXFxSkhqZlY0ZWRNalJMblRSRUdudkZNalBxUm5I?=
 =?utf-8?B?V1BLUFozbm84YmQxV3dNb0laUWtFa3ZrTHc2SVYyMzUzcVlEM2hUcHJPZEJW?=
 =?utf-8?B?OFhyQUI5UnNRZUpPN0pXWExXZ3B4ZGVhMlBhWE9iRnNSbVhGWTJid2k0Mllp?=
 =?utf-8?Q?5IAg1MbsmELCuH1KddZ8zg06d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d787569-de2f-4bb1-60d1-08db30544ae0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 12:51:19.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHbyXao9i9q/68avPDak6jBDcDUdIB+aae7niznXzft/Lv2mYRTM8pJ0iA1LzTEt6w6DQaPoc1/77sDKBRAKGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 29.03.2023 12:18, Roger Pau Monne wrote:
> Accesses to the PBA array have the same length and alignment
> limitations as accesses to the MSI-X table:
> 
> "For all accesses to MSI-X Table and MSI-X PBA fields, software must
> use aligned full DWORD or aligned full QWORD transactions; otherwise,
> the result is undefined."
> 
> Introduce such length and alignment checks into the handling of PBA
> accesses for vPCI.  This was a mistake of mine for not reading the
> specification correctly.
> 
> Note that accesses must now be aligned, and hence there's no longer a
> need to check that the end of the access falls into the PBA region as
> both the access and the region addresses must be aligned.
> 
> Fixes: b177892d2d ('vpci/msix: handle accesses adjacent to the MSI-X table')
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

And thanks for taking care of this so quickly.

Jan

