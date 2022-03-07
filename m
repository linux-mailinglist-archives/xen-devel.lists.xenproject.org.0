Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E44D023A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286158.485550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREqI-0002Ey-QL; Mon, 07 Mar 2022 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286158.485550; Mon, 07 Mar 2022 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREqI-0002Co-MM; Mon, 07 Mar 2022 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 286158;
 Mon, 07 Mar 2022 15:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EJ7=TS=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nREqG-0002Cb-9m
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:00:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 464327bf-9e27-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 16:00:06 +0100 (CET)
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
 by GV1PR03MB8112.eurprd03.prod.outlook.com (2603:10a6:150:23::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 15:00:03 +0000
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d]) by AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 15:00:03 +0000
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
X-Inumbo-ID: 464327bf-9e27-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQEmUrKwOncBxYopxKs0R0xOPA49eGt1a2bI0EdmwrG0iEvvPelLWDLQcuJpyz/IJLUWnQh43aflYD9VhO7GLkhaOaA8m44QJlyypCbb3ut1ZIBhwl2abWs43o6sKrMfqJg7x1qfdg/HiuqLsGqIGlcg9Td9j4ozStwpAX32Es+fXYfkqdgH76EZMIgCskTmHvtTZ8C7Peuq4y8ZxTBgMa6COydYEmXDlzy+ZoRc3ioQvWDp8U7C+f9zeXN2hdGOuEyzCudViDSSaV7KhBdsYaNwgp8UJppTzcXisjfKMfM6lKRvxeQr6/k7hqF/QWFFMWvzwFEAXWeWU19M+s34jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlyDpvG2RcY23M/mSa9UtC9Ah5HjLZStW52pPkfn6c0=;
 b=DUZ54c2QDSmhmxahhfwHfmbvP+5YzZSgvPxZm7N1Xtk/eY1MMUVp7Tr7UX5zMtnDJy4gqM+LCJS4ig8Akkz8OzWwPRHhMahczH49ocTuXqCl/TpCovGeR48B/TcjXD7DDQLoy5W1pTKeq43VIDlGGvTqVDzcWJ4lZmCEX5eoe/LwexoK0OAFTPuUyJ/SpooOPlw+4rtD7+yXldINqfkxJ/De/6YIbtF14BYgHtMOamMG8Ew4+SEK7rv5fQGRUb6QvsMu8yb4U358e37y7j40d+Msl8xzb/8JpGwznLBuaxvHp6Qj5Q4+TYu/ILH8KLwO8IdzjCbTpeWOa9FBTW2QSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlyDpvG2RcY23M/mSa9UtC9Ah5HjLZStW52pPkfn6c0=;
 b=kKcKvWIzeAAHDGsPLweXfzL4orgHTv1Kw5So1yoaGwBW15ZR+QntmzlAh64A+eOnmRpNczE0VIS47R9Fv52efOicVGDbgJl+8jzebKwq2BPbOJ+qTQRW4snTEUI85fHfajrx/pdMHNdRCcb/DAy5mMt2+ZDJAKXUZUE7IXutdV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <9b38e9b4-b2e9-b790-397c-38d7b62443d4@santannapisa.it>
Date: Mon, 7 Mar 2022 16:00:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com>
 <6028180c-ff1c-5d4f-2cf2-582e4104d888@santannapisa.it>
 <04e4ecfb-0235-db0d-d5fd-3274879003fa@citrix.com>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <04e4ecfb-0235-db0d-d5fd-3274879003fa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::23) To AM6PR03MB5000.eurprd03.prod.outlook.com
 (2603:10a6:20b:88::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d6e1772-d257-4477-8bff-08da004b28cf
X-MS-TrafficTypeDiagnostic: GV1PR03MB8112:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR03MB8112BD0B517AAA2C4D3C8C3E98089@GV1PR03MB8112.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UXSCd/hboGvfdNxQghCydZMw19AuPL92wmRn3PYuJ7Viysz7TAYpibPeF2SDRN94tnhsgGe9/JHtfBMiHgsYsgKQkbgmSLGSwJwqGkDlsmb4W/39RIPqlg6kef9p1dp6fmmM0XIqxei7y99nWqWm7of0zputd3odRncW+GaBc3XZZ3WMLHsEVeV7AbGWRo94iGiZmjd27DLy0isimcn/A72FpZT8EOc+JZyU2cEa8NpgbOipFQhhy8DlXkx5fCuyJjkfthO9S64LrKajrYVqoe8bgYazbkq/KDHfN7SaI/TIxR6kRFn8oQNAbw4OFUR8d2V7BTQ7Xiw18ewg18/GkLTo1VHKqkDHQk+Xo/6vKzN9SWWVIHHPgatPdiqPQrsl5AEaAcv1FUgKyaDBrxr5YpZAv6typQu0q0cGVMJzgyj4ImF4irEuAfsAssmOoEi0HB/csYrxXqEbgdBc4DUyltxQrZxAh867I2dAH3VyOP6GynCgON8yudaSWhKpq/Z9q3Rz8XMh32Wy6Q+xTReHasu0WaZDqQAxhkY7hCwVFo+BrRUr+0zOnJoNqA6DewINfiQYeJzp+KQktPX2+TimsRNtsokjXxsBiPtgHgfWgysEW1cc7wymxDxrDPgxyvbEj8rSVCWcnjwIgkEAB0PTEVcFNQ1vUzvDhKvTcWhMd+QpCld4agzHlZyd82fruG/1c8HiVpnjYY1nbOU00d7ZnZV+uXzp9SFnljfWfeW+EtklSl2Q1lZL8ve09gtM59yxc9tsEqlD7k+q6C2FLDQbSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5000.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(83380400001)(31686004)(44832011)(3480700007)(8936002)(5660300002)(2906002)(26005)(186003)(316002)(52116002)(53546011)(786003)(6506007)(38100700002)(38350700002)(86362001)(6486002)(31696002)(66946007)(110136005)(2616005)(8676002)(4326008)(54906003)(66556008)(66476007)(508600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QksyNTlja2pIWitSUUZvdWcrMEZEakVuTWJ2WWlwL05ieHNWTUxLNjFxMlVw?=
 =?utf-8?B?bnBKVEJXazRVUDhma3dmVUltWlhzTHRwSjFvYjkyRXlmK2ZFczNobm5BZGlR?=
 =?utf-8?B?TWZTTlgrWTlwbWtxZHpoSEREY1FJMzc1azdOOHBVeEF3SERhWlFZMFJnQ05L?=
 =?utf-8?B?SHBmalIrRUZCdWF4d2JrTzVFZ0JxZnRkMkFRV284UENMT0YrVkorZ2tRSURP?=
 =?utf-8?B?SEVrT2NLbC90OVpMdVNGMEErbmx3cVB5QlF6ajlZVGJFNmhYb1BtWVRicGRa?=
 =?utf-8?B?blBZMUZtd2dURDl2TlJzbElHU2VhbmpldFNMRjYrNkhxem9nY2FmWDBtcnJm?=
 =?utf-8?B?enlqc1pyb28waU92VFVIbFFQU0dUMHA5RlZXaDF5YzFiRmRoNElMWmlxaTJM?=
 =?utf-8?B?MXJCMUpYSk52SFV2MU91U0ljZVdzVzJ0OHZhdXpLdVVmZFNKVDVVU1dER3NP?=
 =?utf-8?B?bzlrK21lWEJUMCtyV2JoL3RTcVJGREx6L1JhbE1VMUYwQ0FTZjVtREtOREh3?=
 =?utf-8?B?ZUZIeGFiZ2RCTUVEZk1QdWRQcVM0N1crZVN5cCtXeXZmMzNSUERLcFpCazli?=
 =?utf-8?B?aGIvMWkvV2E3OG5hY3NDSmliVStZcXV2MjVYdUtzbENGcDBnSGw2OXhCRDRp?=
 =?utf-8?B?b2F2bTRJTGR0dGpzWXpUTVErZUx4UnBDOGFjNCtVMHhPOUdvRzdDUVFPUTJ2?=
 =?utf-8?B?RlNta1RYQzg1Zml0Ym1CVnlWS0QybXYxczIxMC9qS21Gbjc5aG9VRXFqS1Nz?=
 =?utf-8?B?YVdKYjlGT1p5bE1TT1RRa3V1NStqc2dOUDdOOGlPb0xYQkFCSGhhTTl6VU9y?=
 =?utf-8?B?anNCUytJZ08zSWREblVvVmRGTUVreUUxd05OdXkzbTc2dVlGc1ZvOWtPdUFl?=
 =?utf-8?B?VndiUzMxSzZUaWZ5THU1Wi80dFlSS3ZUa2xURGJyU1VqU2t2NUl1bnpvYWJV?=
 =?utf-8?B?Z3J4SjhhVmFLejZoMlYzbkxIc2E5WWpQOXdMSUlONEtjN3k3S1h4QWtScmdj?=
 =?utf-8?B?a3RtR2g4QXBXSnVUUWNRYXNvaFFNRkpWaE16MHRoeUpTd0NiSXdCbVdZcU1R?=
 =?utf-8?B?VmlHVWpZYUpySmQxQ3M1cVdGNWc5VEI5QUkzYmtRemo3dVo3SUxFcitMdzZJ?=
 =?utf-8?B?RHpFWUdZT3VaRjVuZnUrV0JqOHV4T1dzbU9QYXpUWkx5V0o4QlUvenYwUjcw?=
 =?utf-8?B?WmNYcmQ2bVZLVEszVTRTRUFBeWtLYXB0VDI1Ymx6THJOQ1YwOWFkdHpIbzVE?=
 =?utf-8?B?WmJlSExTWDQvUTJ0c2hISFdjS3BpNHlWZjBKNklDYkNlOXhsL01XRVE4eE1s?=
 =?utf-8?B?MHdNNDlWK05FQllFWFU4OUVGbHNRQVlJMEE0RmtveWRPUGt0OG9FdFpoRGJm?=
 =?utf-8?B?YXhxY2lRblh2dURsSE5vNnRDOFVPNytvTjBWSVBCNytINHd4NVVkbnU2dnpH?=
 =?utf-8?B?L1JiMmJYeWdyNGdIWHdkN0Y3TnFxci9MZ1VaMmdIL0tIanNTeXpNczZwN3Fk?=
 =?utf-8?B?czNuNHI2TWNrZ1BwMTJQV2lJaUxFQ2IvSk0wZkFSUThINE9NeXIxT1JGdkFk?=
 =?utf-8?B?RTA5blN3Kzd2dXUwcXVBSmRGMWtVRTNyRW9wNkFFZ0FlREZaOURjSlI1Zi91?=
 =?utf-8?B?Mjh3RFdLV0dLWHp2ZVBtVVZBZlhxNGpIanZURUtWV09CMGRRUFpkdVQwKzZu?=
 =?utf-8?B?N2p0MHNrTjl0YjAzZG5qSVIyNUhubC9DcDE4VHluZ1QwV1ZIZGozYk5ISXZu?=
 =?utf-8?B?Yjhac1diRFY5dHYrcEptOUEyWnJqVGVFMFAydFpRQmhmRVBVTWtYQ2l5U3Ux?=
 =?utf-8?B?QnRaQ1JtMmZ1dUxhOHZiVCsrVWZ5aDN4RXBsTDJoUWY4bFMwSEZOMHRSbENq?=
 =?utf-8?B?UkhCVEl0L0RtNFFCblFqSTRLdDk5aVovVlZWMGE4NTRlVTBFRUwvSnlTRHpo?=
 =?utf-8?B?YVVhZUM0Z3ZiRkxnYzdod2FuM0EzOVB5ZUxha3lNNjU2a0ZJblhYRWlWVmR6?=
 =?utf-8?B?MTRyRExBMlFVcTd1MElHZkVQM3RLUWFtaFlNWnlSSmtqWSsxdk9PcW5ucjhm?=
 =?utf-8?B?UFdVUFZ3TDE4K3hscXVNdm9WSW5pYXFRcTMrTDBhUkM4RzJjd3J3MEJlU0lJ?=
 =?utf-8?B?WnQ2eWF4Z0tGNEJXQU4zYktWQXlUcjRJYlZSZHZHcDdWaytGRCtacExVTDNO?=
 =?utf-8?B?aVJNcDJQVWZPdW5WSHUxU1Jya0plWHJaOUJWVlV2cWhYWTFVb25xQndRZmlu?=
 =?utf-8?B?MEI0dDY3STBkUXl0M0tNWHFuNTZLRnhocTdUZ2p1SDhhOUtPdWM4U2NGM0pX?=
 =?utf-8?B?N01POERSNnMyREdoME5IcmQ4aVBTUWVXUnlTR0QzVDZMUDB6TnpCQT09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6e1772-d257-4477-8bff-08da004b28cf
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5000.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 15:00:03.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8tq1ctNaC9QQRNVA4S+4z8a15iDCG62ufaVTnjuxTcKGogaHCV2Oe7G01bhwN5tQd9Ib4SYJzEJ5ccATo5uwbN9MVSDGEXdWaXaJLd+NtzyUHszm/SuAm4Hi9sagtkJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8112

On 3/7/2022 3:50 PM, Andrew Cooper wrote:
> On 07/03/2022 14:43, Andrea Stevanato wrote:
>> On 3/7/2022 3:36 PM, Jan Beulich wrote:
>>> On 07.03.2022 15:20, Andrea Stevanato wrote:
>>>> On 3/7/2022 12:46 PM, Roger Pau Monné wrote:
>>>>> On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
>>>>>> /local/domain/2 = ""   (n0,r2)
>>>>>> /local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
>>>>>> /local/domain/2/name = "guest1"   (n0,r2)
>>>>>> /local/domain/2/cpu = ""   (n0,r2)
>>>>>> /local/domain/2/cpu/0 = ""   (n0,r2)
>>>>>> /local/domain/2/cpu/0/availability = "online"   (n0,r2)
>>>>>> /local/domain/2/cpu/1 = ""   (n0,r2)
>>>>>> /local/domain/2/cpu/1/availability = "online"   (n0,r2)
>>>>>> /local/domain/2/memory = ""   (n0,r2)
>>>>>> /local/domain/2/memory/static-max = "1048576"   (n0,r2)
>>>>>> /local/domain/2/memory/target = "1048577"   (n0,r2)
>>>>>> /local/domain/2/memory/videoram = "-1"   (n0,r2)
>>>>>> /local/domain/2/device = ""   (n0,r2)
>>>>>> /local/domain/2/device/suspend = ""   (n0,r2)
>>>>>> /local/domain/2/device/suspend/event-channel = ""   (n2)
>>>>>> /local/domain/2/device/vif = ""   (n0,r2)
>>>>>> /local/domain/2/device/vif/0 = ""   (n2,r1)
>>>>>> /local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"
>>>>>> (n2,r1)
>>>>>> /local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
>>>>>> /local/domain/2/device/vif/0/state = "6"   (n2,r1)
>>>>>> /local/domain/2/device/vif/0/handle = "0"   (n2,r1)
>>>>>> /local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
>>>>>> /local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
>>>>>> /local/domain/2/control = ""   (n0,r2)
>>>>>> /local/domain/2/control/shutdown = ""   (n2)
>>>>>> /local/domain/2/control/feature-poweroff = "1"   (n2)
>>>>>> /local/domain/2/control/feature-reboot = "1"   (n2)
>>>>>> /local/domain/2/control/feature-suspend = ""   (n2)
>>>>>> /local/domain/2/control/sysrq = ""   (n2)
>>>>>> /local/domain/2/control/platform-feature-multiprocessor-suspend = "1"
>>>>>> (n0,r2)
>>>>>> /local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
>>>>>> /local/domain/2/data = ""   (n2)
>>>>>> /local/domain/2/drivers = ""   (n2)
>>>>>> /local/domain/2/feature = ""   (n2)
>>>>>> /local/domain/2/attr = ""   (n2)
>>>>>> /local/domain/2/error = ""   (n2)
>>>>>> /local/domain/2/error/device = ""   (n2)
>>>>>> /local/domain/2/error/device/vif = ""   (n2)
>>>>>> /local/domain/2/error/device/vif/0 = ""   (n2)
>>>>>> /local/domain/2/error/device/vif/0/error = "1 allocating event channel"
>>>>>> (n2)
>>>>> That's the real error. Your guest netfront fails to allocate the event
>>>>> channel. Do you get any messages in the guest dmesg after trying to
>>>>> attach the network interface?
>>>> Just these two lines:
>>>>
>>>> [  389.453390] vif vif-0: 1 allocating event channel
>>>> [  389.804135] vif vif-0: 1 allocating event channel
>>> Well, these are the error messages, from xenbus_alloc_evtchn().
>>> What's a little odd is that the error code is positive, but that's
>>> how -EPERM is logged. Is there perhaps a strange or broken XSM
>>> policy in use? I ask because evtchn_alloc_unbound() itself
>>> wouldn't return -EPERM afaics.
>> As you can see I'm pretty new to Xen. Furthermore, it is the first
>> time that I heard about XSM, so since I did not change anything I
>> do not know what to answer!
> 
> Please can you attach the full output of `xl dmesg`, which will help
> answer this question.

# xl dmesg
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000000000000 - 000000007fefffff
(XEN) RAM: 0000000800000000 - 000000087fffffff
(XEN)
(XEN) MODULE[0]: 0000000007000000 - 000000000700e000 Device Tree
(XEN) MODULE[1]: 0000000002a00000 - 0000000006d1e0aa Ramdisk
(XEN) MODULE[2]: 0000000000e00000 - 0000000002891200 Kernel
(XEN)
(XEN)
(XEN) Command line: console=dtuart dtuart=serial0 dom0_mem=1500M dom0_max_vcpus=1 bootscrub=0 vwfi=native sched=null loglvl=all guest_loglvl=all
(XEN) PFN compression on bits 19...22
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Xilinx ZynqMP
(XEN) Looking for dtuart at "serial0", options ""
 Xen 4.14.3-pre
(XEN) Xen version 4.14.3-pre (xen-4.14+gitAUTOINC+e9efd896f9-r0@petalinux) (aarch64-xilinx-linux-gcc (GCC) 10.2.0) debug=n  2021-09-24
(XEN) Latest ChangeSet: Thu Sep 23 18:38:11 2021 -0700 git:e9efd896f9-dirty
(XEN) build-id: 4b7faa4d0c0a308eee0ae8eb52a6fda106026076
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 1100000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00001231:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.2
(XEN) Using PSCI v1.1
(XEN) SMP: Allowing 4 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 65000 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000f9010000
(XEN)         gic_cpu_addr=00000000f9020000
(XEN)         gic_hyp_addr=00000000f9040000
(XEN)         gic_vcpu_addr=00000000f9060000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: Adjusting CPU interface base to 0xf902f000
(XEN) GICv2: 192 lines, 4 cpus, secure (IID 00000000).
(XEN) XSM Framework v1.0.0 initialized
(XEN) Initialising XSM SILO mode
(XEN) Using scheduler: null Scheduler (null)
(XEN) Initializing null scheduler
(XEN) WARNING: This is experimental software in development.
(XEN) Use at your own risk.
(XEN) Allocated console ring of 32 KiB.
(XEN) CPU0: Guest atomics will try 1 times before pausing the domain
(XEN) Bringing up CPU1
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
(XEN) CPU3: Guest atomics will try 1 times before pausing the domain
(XEN) CPU 3 booted.
(XEN) Brought up 4 CPUs
(XEN) smmu: /axi/smmu@fd800000: probing hardware configuration...
(XEN) smmu: /axi/smmu@fd800000: SMMUv2 with:
(XEN) smmu: /axi/smmu@fd800000:         stage 2 translation
(XEN) smmu: /axi/smmu@fd800000:         stream matching with 48 register groups, mask 0x7fff
(XEN) smmu: /axi/smmu@fd800000:         16 context banks (0 stage-2 only)
(XEN) smmu: /axi/smmu@fd800000:         Stage-2: 48-bit IPA -> 48-bit PA
(XEN) smmu: /axi/smmu@fd800000: registered 29 master devices
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) alternatives: Patching with alt table 00000000002c3360 -> 00000000002c3b28
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000000e00000
(XEN) Loading ramdisk from boot module @ 0000000002a00000
(XEN) Allocating 1:1 mappings totalling 1500MB for dom0:
(XEN) BANK[0] 0x00000020000000-0x0000007c000000 (1472MB)
(XEN) BANK[1] 0x0000007e000000-0x0000007fc00000 (28MB)
(XEN) Grant table range: 0x00000006e00000-0x00000006e40000
(XEN) smmu: /axi/smmu@fd800000: d0: p2maddr 0x000000087bf94000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000000e00000 to 0000000020000000-0000000021a91200
(XEN) Loading d0 initrd from 0000000002a00000 to 0x0000000028200000-0x000000002c51e0aa
(XEN) Loading d0 DTB to 0x0000000028000000-0x000000002800c4d5
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 336kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d1v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d2v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d2v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d3v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0

# cat /boot/xen-4.14.3-pre.config | grep XSM
CONFIG_XSM=y
CONFIG_XSM_FLASK=y
CONFIG_XSM_FLASK_AVC_STATS=y
# CONFIG_XSM_FLASK_POLICY is not set
CONFIG_XSM_SILO=y
# CONFIG_XSM_DUMMY_DEFAULT is not set
# CONFIG_XSM_FLASK_DEFAULT is not set
CONFIG_XSM_SILO_DEFAULT=y

This is the default configuration shipped with petalinux. From the
help menuconfig, it seems that this XSM SILO deny communication
between unprivileged VMs.
 
> ~Andrew

Cheers,
Andrea

