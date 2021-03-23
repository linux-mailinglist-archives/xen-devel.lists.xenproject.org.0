Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D03345B8C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100573.191737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqd-0008MF-FV; Tue, 23 Mar 2021 10:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100573.191737; Tue, 23 Mar 2021 10:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqd-0008Le-BO; Tue, 23 Mar 2021 10:01:15 +0000
Received: by outflank-mailman (input) for mailman id 100573;
 Tue, 23 Mar 2021 10:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqb-0008Eu-GH
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba0ad827-ca82-4208-8b2f-546188866a20;
 Tue, 23 Mar 2021 10:01:06 +0000 (UTC)
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
X-Inumbo-ID: ba0ad827-ca82-4208-8b2f-546188866a20
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=4lHE2jerg+jbItJ/+12Vb+5du8PMBfuwXfXIwSVEhTU=;
  b=Ms7dQoMLj4gSnW+pX6RZZfbzsK5c3WbHTvE03+dvu4B4XZ0FtPVNKxyu
   QcI68rIqByFL2sMWtJ41+8AxvEJlaQwo3Cj8omOELRhbQcuOa3D9kSLcz
   jnHAHXKq3vCVLMEx4E6WI2VXfLVKzvR7xlOrU+pe2pH5DCMPuqtfKSq0b
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g7DxBHYwtYpWsEK6qiAP6OXHSwV0FtbUHsNBYw9n2kIZlqi8GS6hpKwlcTAhC5J1VrRRVB1i0G
 pCXKUGpkKJ1LxQVufXNH/2aug9GpnpFptmhWkh5DswzwhjxcmDP5Ls801+EMckIgaAVjg/6Irx
 T37oLgcVTNcQtd0cFw5VF7QMVuNXZ1992p4mxEBlZfWmidhgcNgHxuR+yKjXm5R5zZRFnbI5Fs
 yr5J5u3kPIfyn8uA31Tw7g6Gj9Sfjr+AH2OyH4sGI4Ci5X3wOlnHq2QZR8yZQR8U9Kc6VMNldV
 PT4=
X-SBRS: 5.2
X-MesageID: 39779677
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5+QMA647FC3TfJosLgPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpT+jvfMk4/rZgNDOg4/5GC1/E6VwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/tFQPeBk80Ebgjr4zzYH7hJf52nkHQLrPq06FAs+e
 O80ysIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerh8rLlUfRfD500rsMsU6t
 Mw40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ05baIibtZq3Oki1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmIpA79Ij
 CkglVg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyPbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8AdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X7KYAr+TV8Zi4
 1DfVERacoGqgBKtvxJ7gGCDortokwklFNC5ypAjVCF4Pn+3Fvm
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39779677"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETCXfI8+ug8o2r3jD159Dfvxjq9eQ5HaZhNM224zFkq1yEmJhZF/asZzlR9JekKmCW8vxJTQszxiCDgzSDHVYqooEHEuTiKEYE3sZq2oww6knc3d8mq8Gq/jYkv/NoCjNpbuuZVDuAZuXEn7jhwHiVc46aXGPZQQDiKKH841FlcWwvQRlJJsh58RrUL9OgF5iEeAXlJHLzACl0ffgvLuQI/UJ/AmVoySa0yn1dklPhiV71ib9E1znyOx3wnGzyjKcNatQRBDstxrAS4LpfGHYOOTBeMwhnzNNoMlOF4YQ730n6uM8FEiE2VFQiT6RhCfRCpIlCmjHTevytX0Lhcgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Blm/0Bd7WSGIeDuYXRMAPB5HSkKSVJuxKVDttIrYYCg=;
 b=klrFH4V3jYsh5HZM3rZXQQHfJovV8oh/QsSy7bXXZ2LxJx2RQlPkXJBfhsz1SRAXYHO6dKSHHn6SE2Z7qvZQ4dyP8gJGvOhPyuNob8d89/dyJZLZjsjZTXLdf0K0RDwJYRl9VbQOUsRSkxCqVvzvzKV6eUI9Uqnpy+217Sj3sKFBObAfBxpmhhNSv5x1xpFXEQUSAQBCSE9zS5nB0nPWR9zo9otqYwuyeVpdCZ/HSqjU0HXhKml9bkzrf7mxK3KxbZ29Dzrie9wEYrAIklcIm3mIkI7z5t7/x8vE4idYpTucFfTs3VIxdV3YJvVCvAPjxSL51SA8+b8ykgOvdBEmhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Blm/0Bd7WSGIeDuYXRMAPB5HSkKSVJuxKVDttIrYYCg=;
 b=ck3d6o4ZCj7tLxrgbrYwNUpew2URpTntyP9ahfroDKOb/DQnjSLnTv+sjy3s4f4i8WoS52JIWygoPpd987crw4Wy9qm0KrzAtGa1oQLS3lWEae1S8vWZDUXWti6pgOSualiSmDScpTu8kD24IZ1/vGsh7UpLAZBIL1svJPkmG0g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 15/21] libs/guest: obtain a compatible cpu policy from two input ones
Date: Tue, 23 Mar 2021 10:58:43 +0100
Message-ID: <20210323095849.37858-16-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c6c3518-4f3d-4d3f-f189-08d8ede2913c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49693F2A7923976599AA0EE48F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DVBL7yOKHSTGw8bYEX6EyAgcb5SMH6bb6HORNjz7trlRfw0L/RN1ZrhXD+Z/+WqyMryYLBVFT+EkVm0+dwilsjaVgAGjhadNAfD9A0a9Fld5PwhrwaYGQFcz5uhzhlitrgPbw5JROpIF3RLSq9Kl4C5EZs17HsChN4+y60v5q0i44f2g5u6RYjJNkYobi6P8ow1U0i+5DOoR2Celn6jRRmi/ppyAFjO0cGoOIbZr5B1I9Z263kqwvlvkzBmsBCYNYjS21xpJpefn8KtlRWbawo1GySO6BBb2VrgXx2dzC9mBv6PBrOirbdKB2Z3kJo2r17p5nd0KQNI7zyALv4BwZ/z43WmxmqVehnZXGQP6VVOWtSN0vgZN1YYasly5v/IbA8aRgjg1dcjXf5tUDZp2cvJNmxEVsdI07byxs0KQfyRrO1pRNfwuBXIh1nCNAi1GLZNEbHL4T47WFnQVp/lMoqAxpcQdBTJ2OGPo8pdfb2JsIBIwqmnkuC3fvVk56l3c/YQqRBI2x7MuLg5KB0mKZqwqI+IFDEIXulM7IJ9R1lRhIB/N++kh83shNuvcKoIuc6VMi2YqHzKHhqPSdgF0M/NGiqehOws5VIDptz125bNnu7lMvK5XTL/uN+y1r+i07yrHROww5IFHQ3jbXLkZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(107886003)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEt3QzFpQ0o4dVlTUVlPM3d0dzg0NlFIWEdzNW83dFpTck4xVS81a1lKeGJF?=
 =?utf-8?B?aW0yUG9MdDVyWHV2UTJkTlVEQXhCeklWZkJMTGxNdmg1Y0czZC9mTFhod1lh?=
 =?utf-8?B?V0tObFlIelRyZkpCSERVNWU0VHNFcXo5T1k4bmNCdDZncGpWbE1aYnA2ekpW?=
 =?utf-8?B?MVErbzNFRm9CYWY4TXYydVRTUDdzWkRPaFNHMEl1aTdEMkgyTHBaVEhkNDJv?=
 =?utf-8?B?MFp5RjBNWndZR1VLUzFWbThJRTB2bjJvaHRSbDV1YTV4NzkxNzkvc2NqdTZ6?=
 =?utf-8?B?Y2daUlh6anF5Snc0dVphODVRKzJNL2loZ2VSUG1VMUtyRElQYjgvZFZZenRK?=
 =?utf-8?B?YVdnN0l2ekovcll2Z0M0bTlQeW9YWjBhdzlmSng5QVhENVFVWUwyMmhDaTFV?=
 =?utf-8?B?TkRFU2lwMHVPcWpXenYyOG4zam9wT29TS3pKOXA2dVVXSENKS0tCdER2TlJR?=
 =?utf-8?B?SWF6aUlaUWpsK1VNZk4xSlFVTHpFZno2bmxEUUY2bWxRVzJSd0pyMWpndGRV?=
 =?utf-8?B?ZXhnQzFCM3VzOVJtUXBLR2ZEd0tFUzE3UkI2S045T1A2WWxzYXVLait4L2FR?=
 =?utf-8?B?Y2VwUE8yOXN3YnB5Mm1Fb1VQa2Q4VXl6SHFGQ0Z3dU9iZW45TCtJc0lPdGtu?=
 =?utf-8?B?RlFVOUdzakc4akxzVkRBRGE2blNhdXdseTRmRFVsZGNVN3RXajBLS043Y2ZQ?=
 =?utf-8?B?TUUrNDA3UkFVWUswdlhOYkJwakpiY3NRMWxWdTgwelpycDdlRFFOTEc5Um5V?=
 =?utf-8?B?bUJoOWU1WGUwbWRVSkxQdHVpUXJQdjFzODVFNHJ5K2JzVlBoTzN6N2hVZWZs?=
 =?utf-8?B?OTJxUW12V1RJWGN2UXZTNkx0a0sxdEt0TE12K0VMSk9QaXp1bXFQZ3ZUamx4?=
 =?utf-8?B?c0NZNGYwUzJtZG1pbTFzMVBxRUZ5WGNQcGpXYnpGZXpJZk56MklIS2V3OS9D?=
 =?utf-8?B?dlR1OVBHdWFGQ0VMdTVFY0UrM1AyblllRFc2VTJPS0d1NmZLWjVVbklYSHg1?=
 =?utf-8?B?L1BRN21BTzFCUFh0amxVMjVGNyttS1NRWjdhbXNZRlVEeDFlbitIblozSnF2?=
 =?utf-8?B?UXU2Y2Z6d2tLbXFyWUNxSHo1akRzb21KY3JFR0l4YklDaFNYRWg3M1B5MURj?=
 =?utf-8?B?cytHU1dtbXhxbHMrc0liaWh1MU52TGdWSlNQQ3BIaEVINGRIWDBiaVhMeHE1?=
 =?utf-8?B?T0Nrb1d1YXNuMXI5aGtrbWdoNUE2cU9xVkorZER6MUI4OTRlSEFPK1RXNEhL?=
 =?utf-8?B?MHFJSFk0ZTY2NVVQQkxtWFRGZEo0QjZxdXhoMnF5YzBpaGVueHJXTFI4NjFU?=
 =?utf-8?B?V0hpQzJhSjY4R05UbFFmR3pVS2FyRGVGbGloWkhTd1V4WGxrcGg5azUxcXls?=
 =?utf-8?B?c1Z0bnJsM0k4TU8rMDU4RWJIWG1TTG5hNHV4Zk5EZnA0ZkViRnMxdENIY08z?=
 =?utf-8?B?S0FMWFRpQjF5emYyclJLYWZUbVRqbUx1TjFEWkVoVkVZVC9hZFlTc3UyM1hN?=
 =?utf-8?B?d2lNdTErMTRoM3RZUTlWa0FaSFZBcnZGZHRyZVRncXlMUEJIOTNJYnpBRVI2?=
 =?utf-8?B?K1pDNEhDRGFtSnhzNWI5SHB0cUpiQUFhb3QyZTZtdEY3L0hwYXRlektFdEkv?=
 =?utf-8?B?bVZDNndtK3JIU3ZSd05xSXNzTDNBS0VmS0g0VzBSS1ppZG55VThkeVdjTE40?=
 =?utf-8?B?K1NWcDIvZkkyTG1IczVmUzNFcC9FMExmeVdicnB4eDJvZ2tObk01UUpPaEtR?=
 =?utf-8?Q?2Zof/etTs/ixJliBRQqr+jHCFbv47wJny3rq5XW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6c3518-4f3d-4d3f-f189-08d8ede2913c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:02.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmBkQTDaZgYjvGrZzSZcRLwEcJRHNbMFH99lfS0ltQcX9GYSgV6GcICqwk8W0nZyu5IYAZGAHKIYnAHXV+jKww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Introduce a helper to obtain a compatible cpu policy based on two
input cpu policies. Currently this is done by and'ing all CPUID leaves
and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
bit or'ed.

The _AC macro is pulled from libxl_internal.h into xen-tools/libs.h
since it's required in order to use the msr-index.h header.

Note there's no need to place this helper in libx86, since the
calculation of a compatible policy shouldn't be done from the
hypervisor.

No callers of the interface introduced.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xen-tools/libs.h    |   5 ++
 tools/include/xenctrl.h           |   4 ++
 tools/libs/guest/xg_cpuid_x86.c   | 115 ++++++++++++++++++++++++++++++
 tools/libs/light/libxl_internal.h |   2 -
 4 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c38070..b9e89f9a711 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,9 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef _AC
+#define __AC(X,Y)   (X##Y)
+#define _AC(X,Y)    __AC(X,Y)
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 165beff330f..5f3e5e17e9d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2622,6 +2622,10 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
                                  const xc_cpu_policy_t p2);
+int xc_cpu_policy_calc_compatible(xc_interface *xch,
+                                  const xc_cpu_policy_t p1,
+                                  const xc_cpu_policy_t p2,
+                                  xc_cpu_policy_t out);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 30ea02a0f31..4afca3249ba 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -32,6 +32,7 @@ enum {
 #include <xen/arch-x86/cpufeatureset.h>
 };
 
+#include <xen/asm/msr-index.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen/lib/x86/cpu-policy.h>
@@ -1115,3 +1116,117 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
 
     return false;
 }
+
+static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
+{
+    uint64_t val;
+
+    switch( index )
+    {
+    case MSR_ARCH_CAPABILITIES:
+        val = val1 & val2;
+        /*
+         * Set RSBA if present on any of the input values to notice the guest
+         * might run on vulnerable hardware at some point.
+         */
+        val |= (val1 | val2) & ARCH_CAPS_RSBA;
+        break;
+
+    default:
+        val = val1 & val2;
+        break;
+    }
+
+    return val;
+}
+
+int xc_cpu_policy_calc_compatible(xc_interface *xch,
+                                  const xc_cpu_policy_t p1,
+                                  const xc_cpu_policy_t p2,
+                                  xc_cpu_policy_t out)
+{
+    xen_cpuid_leaf_t *leaves = NULL, *p1_leaves = NULL, *p2_leaves = NULL;
+    xen_msr_entry_t *msrs = NULL, *p1_msrs = NULL, *p2_msrs = NULL;
+    unsigned int nr_leaves, nr_msrs, i, j, index;
+    unsigned int p1_nr_leaves, p1_nr_msrs, p2_nr_leaves, p2_nr_msrs;
+    int rc;
+
+    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) )
+    {
+        PERROR("Failed to obtain policy info size");
+        return -1;
+    }
+
+    leaves = calloc(nr_leaves, sizeof(*leaves));
+    p1_leaves = calloc(nr_leaves, sizeof(*p1_leaves));
+    p2_leaves = calloc(nr_leaves, sizeof(*p2_leaves));
+    msrs = calloc(nr_msrs, sizeof(*msrs));
+    p1_msrs = calloc(nr_msrs, sizeof(*p1_msrs));
+    p2_msrs = calloc(nr_msrs, sizeof(*p2_msrs));
+
+    p1_nr_leaves = p2_nr_leaves = nr_leaves;
+    p1_nr_msrs = p2_nr_msrs = nr_msrs;
+
+    if ( !leaves || !p1_leaves || !p2_leaves ||
+         !msrs || !p1_msrs || !p2_msrs )
+    {
+        ERROR("Failed to allocate resources");
+        errno = ENOMEM;
+        rc = -1;
+        goto out;
+    }
+
+    rc = xc_cpu_policy_serialise(xch, p1, p1_leaves, &p1_nr_leaves,
+                                 p1_msrs, &p1_nr_msrs);
+    if ( rc )
+        goto out;
+    rc = xc_cpu_policy_serialise(xch, p2, p2_leaves, &p2_nr_leaves,
+                                 p2_msrs, &p2_nr_msrs);
+    if ( rc )
+        goto out;
+
+    index = 0;
+    for ( i = 0; i < p1_nr_leaves; i++ )
+        for ( j = 0; j < p2_nr_leaves; j++ )
+            if ( p1_leaves[i].leaf == p2_leaves[j].leaf &&
+                 p1_leaves[i].subleaf == p2_leaves[j].subleaf )
+            {
+                leaves[index].leaf = p1_leaves[i].leaf;
+                leaves[index].subleaf = p1_leaves[i].subleaf;
+                leaves[index].a = p1_leaves[i].a & p2_leaves[j].a;
+                leaves[index].b = p1_leaves[i].b & p2_leaves[j].b;
+                leaves[index].c = p1_leaves[i].c & p2_leaves[j].c;
+                leaves[index].d = p1_leaves[i].d & p2_leaves[j].d;
+                index++;
+            }
+    nr_leaves = index;
+
+    index = 0;
+    for ( i = 0; i < p1_nr_msrs; i++ )
+        for ( j = 0; j < p2_nr_msrs; j++ )
+            if ( p1_msrs[i].idx == p2_msrs[j].idx )
+            {
+                msrs[index].idx = p1_msrs[i].idx;
+                msrs[index].val = level_msr(p1_msrs[i].idx,
+                                            p1_msrs[i].val, p2_msrs[j].val);
+                index++;
+            }
+    nr_msrs = index;
+
+    rc = deserialize_policy(xch, out, nr_leaves, leaves, nr_msrs, msrs);
+    if ( rc )
+    {
+        errno = -rc;
+        rc = -1;
+    }
+
+ out:
+    free(leaves);
+    free(p1_leaves);
+    free(p2_leaves);
+    free(msrs);
+    free(p1_msrs);
+    free(p2_msrs);
+
+    return rc;
+}
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 22b1775b752..53b8939fb5a 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -126,8 +126,6 @@
 #define PVSHIM_CMDLINE "pv-shim console=xen,pv"
 
 /* Size macros. */
-#define __AC(X,Y)   (X##Y)
-#define _AC(X,Y)    __AC(X,Y)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
 
-- 
2.30.1


