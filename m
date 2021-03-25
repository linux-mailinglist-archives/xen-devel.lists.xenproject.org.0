Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C4349482
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 15:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101413.193975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPRIC-0001Kr-4j; Thu, 25 Mar 2021 14:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101413.193975; Thu, 25 Mar 2021 14:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPRIC-0001KS-0H; Thu, 25 Mar 2021 14:49:00 +0000
Received: by outflank-mailman (input) for mailman id 101413;
 Thu, 25 Mar 2021 14:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WusM=IX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPRIA-0001KN-9n
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 14:48:58 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b1bc409-80ce-4281-8ed1-f916497b74dc;
 Thu, 25 Mar 2021 14:48:56 +0000 (UTC)
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
X-Inumbo-ID: 0b1bc409-80ce-4281-8ed1-f916497b74dc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616683735;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DmPO0IYbysDQk+7I/l/pbj2KdotOoj/wQgdLy2IY/o4=;
  b=iZaNr2CqnIqO29wZk3BgS4GVHMOatjIqWL7qJvFweXnbYEmCCEDzZBMw
   UWzJCYtmTjg58OUkC+jLDO6uYdddYvHQvQTSxve/31MeM5XQEyIv5NQan
   Zfm+AUZlkN90DczOZjWwqOVJyVnCj1hHz1rp361j2YZcskTkqr73GO/6n
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pU4dL8Svev6B7U5xwFY3F6IGluYJb9n3gO5DRtFVVUzNsNbDKP+3ZFtDU94lzFYYCUtNDtJ/BG
 8kERGLwegQslzRrKvDvOcGPiTGg2Qm8wE8Urrj0ffekzvFzLfMZhL9709EHMH/z2hk7jHRIgwv
 5c9HFOE8tXPmcBtra1ZTUomCIDS1hfAa1b1xXf8GQx0cfXU0qFQMlzy6Jdk7uNdPjh6/jI0pjt
 8+HEfQIXdr0QenI+w8cyKErrg0YQ1nHHExZvix0IGSdNO+IquAHdoVDVF1NS/U5zhLj4CYjrHc
 kVQ=
X-SBRS: 5.2
X-MesageID: 40134913
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6HKZT6p6/7mtZ6COSFF0wVoaV5u4KtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYytLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh5Y8HoodrXmJX6JSMXHhJP0nj1sRqEyp7fVyKZ0BAXTi9Vzd4ZkF
 TtvgTl6syYwpSG4zDG0Wu71eUzpPLAzZ95CNWImowpLFzX+3qVTaBAf5HHgzwvuuGo7z8R4a
 nxijMtJd565X+UXkzdm2qU5yDa3Dwj62DvxDaj6BOJy6GJJ0NZerh8rLlUfRfD500rsMsU6t
 Mx40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ0nbaIibtZq3Osi1XIQOpIBECXm0ZsgAe
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
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmArhD3I1
 +R7ml0+OrERTKK0dcheugNCFUTTEg383J5+uyeM6XWFQWxbulGuH63KGW0frMYaK+LH9wr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBfqIPzjkI58Az/WKfXKWgqWr58avjDD4DRuDAn5o+r
 FtRAg3dcRMij4rkYst9DO9I5aH+34Yrw==
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40134913"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5Od/h1SDp1KtDqywZc+BWYDMVXh/JOP8Ply4EmSH+P32APZNww8iTc4OV8dkQbWHahbBjjEE5UJ8MiNdGnmRqbvxw+Kgrp3Qr3rTHoHE7FCv73rkIUbHU58cOYKAssQW7611c6ELIkpvuNHEY8xNbYc6rf16yJKg66Iplq6kmUm/Ci80ywTAA3q8FYeQPlb5Um4khCARdATIQaGTWhqFTqPBM1YTia2kWB6xkZfC2ldaSZBgI8FrTfgK17zS3WpwyDK5duNMVJnsypNk8NWuf9GzeikQCOCH/yjCmDqdPBczGhtGvi9qbJNZt3zd/lGC17Fgp2pqjznhznaNr85uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm2+92UHlWb6cKFDUH66BEx+levN4UIjBRdIjEAod1Y=;
 b=LagvkRff2n+tTyeHfB1OcGF1q/gwMhGUjsqK/3w5Hpx70H9w4iloPlar/srtmmq01e5Xzeqeyyfkva4vvb6VnvK1b5sFEuV9D/RFQ/aLEy5L9g1h28eypEIyzKGbbXyeIm+ntEZFzFXeXa7PAchXgzXzET7/VOB/AOghWcyz1SFA0FqKN/uLJfM1xsP7jW0dJ7VWA+g8g9NN+2Jzne+dc3H/I7cLl/kG4JU969rtf1G61OzDMv5lopXEYA/GKcyuVMSzaJ0OY1pcU+w1dsvhrN48nbWbhXN7isUNXmLAWbXXodAjZq1nQbZuLwdaex9mSxFxOve0u0iJwL1PoFfWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm2+92UHlWb6cKFDUH66BEx+levN4UIjBRdIjEAod1Y=;
 b=XOMC04QwS1P9gKy7nKSE4xT4/ek7Ms/hZYI+Ug6MV7Q2pEOjIFKOJT/Sdhi8To0OfOkgHwXHuHa0I702KqEJ1wXiUQWeS3q5YQ8ZhKrR4ui2XPQiIxO9O515R5aSP/dF91pWd62BeAg76EPVaAQ2wFcFFafpI1K5BxEn0rj5BjM=
Date: Thu, 25 Mar 2021 15:48:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <wl@xen.org>, <stephen.s.brennan@oracle.com>
Subject: Re: [PATCH RESEND] x86/vpt: Replace per-guest pt_migrate lock with
 per pt lock
Message-ID: <YFyiyzyJ8HreykuC@Air-de-Roger>
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
 <1616619905-640-2-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1616619905-640-2-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: MRXP264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f40fd728-7593-4a1c-d7e7-08d8ef9d1aa7
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554288A92A08A9E3561378A28F629@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YCLU/r9EopfyQ46+vZHxkEuGCzXaYp1b8/RKrNO6C8tfeRY+h2KADVgy/TZRXHHFHDFnDNHMm5lwP4jmsKjJn00AtWH17eNTD8b/5lzcBuCl3QjEpneLl5Wl2DVSZSRJ9ljZSgxw+uiVVfuqSTGEMU6hc3SC5V/U9S/1zMTLykHSTM2XGl0jjv6PBz4GWexWVrNg9gHOCYtrUOlhslxZPnfTGqHc21amII59UogSUWIFaITrwqnmjksC9mxdIr2cvGsVvU4VLsHvmbU52/3QH2ZmnEivSG68A5iy2gT5Vmbll6iPLHhgzqiPh+0WHYqYihL+7OLd2t7F8t5dHyp/zDA7Jq8xWFCU8Wsb99sZjV+VwtUXdvlVZlfzdwFaaQkhk+y0GvFhc6ovXyzUBcjhV8b+DMacOmQnQmxChVdw9mbf23302o7QuZcOXbqZ9BWmJrDqFmu6r1j0XylW6TvxnrZW1RV+XJ1SJR3Af04OzLN9SYjkp0bjB3QXCcXvHv/eNpfj5+G+wf3H1BXfcEcN0aQ3Jb1TgBBwCkf9gsAOSeBukD26mQowz/SLmrk4MjLN5e5ekJAycdKj2JYqTmTBUepbsdKH3b/Cnc1lkZX6Twpu8BPuQ3GIQVzSXX96j8RmS7M2pIjhutDr3BIql61inr4SMHdquWIGjbbW5v0Pbn8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(346002)(39860400002)(136003)(366004)(6916009)(478600001)(186003)(16526019)(316002)(4326008)(26005)(83380400001)(956004)(9686003)(86362001)(33716001)(85182001)(6486002)(38100700001)(30864003)(8936002)(66556008)(66476007)(6496006)(2906002)(8676002)(6666004)(66946007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHBvRm56TytvNGxjVU1MbjZONnBIbWd6SUs1N0xnOFFrMURWMEp6NGo1Vm0x?=
 =?utf-8?B?Z2V5R2FIYmtvUTZzVEt4TjAzRERBVWZ4UUkwUFNHZjZ1UW43TXBLTDlqRmlH?=
 =?utf-8?B?bWZNWlVlNjAwenBxTHJvT1c1RWloVjVIQ3JndTZWV3JIamNDTFp6bEhyalhs?=
 =?utf-8?B?S1d3UmlVZXpNWnhlREVRMlFIenpDWm9adU1RWWVWa3ZTL3B4VW5nYWFYWkw5?=
 =?utf-8?B?OC82Ni91d1cxdkF6cDdWVkN1akZKbU9ZblFzeUM4K3BqamVHbWcvOTRtTE5x?=
 =?utf-8?B?eld3KzYyZjZNakM2QmpIRnJydUtGUkpEbmRxb0JSUllzSWwrMTl5cTNZeGNT?=
 =?utf-8?B?ZUpPa2N4ZUZsS0RwekVLWjlLNFh3R3BTSTVDc3MyMytLTmVTaE5YbG9SYk95?=
 =?utf-8?B?OWFkNk5VbEYvbTdxd3V5R1FSR040RFpKNFM4L2ovb1IrN0dwd21SYzZkOUpT?=
 =?utf-8?B?RitzQlArZTNVTFhucXVOZWg5YXpnRWcvSlV6VlV1Y0c5cTJLdGczb1JNaEpw?=
 =?utf-8?B?L2lSNzRidXVJV2dwOU96THdJT1ZHVzR3K1FIdldWUFcybXBqbXFBZDRtM2dz?=
 =?utf-8?B?TXZkcWw3UWxTZDljeXR1ZFZWZ0hYNVNrL3p6cUJGVkRGRlQxeEtSSTJVcFFh?=
 =?utf-8?B?SWRDcDk2blY4a2pMN2l0Q3UyZGtEQ3F2eVArRFRTSWZYNWNNWDZOVVR0dmJi?=
 =?utf-8?B?a2M5b3hBNUFYeWNZbGdldVlDK0N6eDBtc2NBZUF2QklwQXQwTFlla2dlRzRs?=
 =?utf-8?B?TEVVeEtQenR1OGdTUkdjN1cxeWVQOTAzamxBWHovREpVTHpibnlvN2VIRzRL?=
 =?utf-8?B?VTdmVDhkdTQ2UmVBS1VvR0RPSi9ZQmhrd3NheUd3VDYrbVZMajZqTEwwZG1R?=
 =?utf-8?B?TXQ4aUM0MEYxVThFZFlUMzEzOXlxSlBMUWtCYzNQb2VvV0JsRWlTZStHdWNW?=
 =?utf-8?B?VmtWM0tyVkJvei9UYzlhKzdvcWFvQW5NNExXN293WGloemVQYlZKdmwzbmZW?=
 =?utf-8?B?T2M0RlBoNnhPZ3RjcjRkUGJnY29rS1NrRXVseDVzcFQ0MjBBbDBtOVBuOTNt?=
 =?utf-8?B?MGNKTVZidVl2bnJ4ZE5ZSktkZER0RFdSRlluVlJVR3Bqc1hPM1hYb2o2WGRs?=
 =?utf-8?B?SWF3aCs3dXlwTHlJNVpMazMwbFl6RS9sQWFNczh2SnMzNXdaVFdSMEtwMUtH?=
 =?utf-8?B?VlJDbXlEY2lKVDVIbXFqRHZsbS9rMlFnaExCRTJGTGI0RW9va3pYUUF6anNS?=
 =?utf-8?B?SmtJRUNSbXhYbndqYVlWSlgvSWtCZy8zcWJiS0xEUEM4clZ3S1UzVzNtcmY3?=
 =?utf-8?B?QjVaWUJCYlBlY0xaQ29DVy92LzFpbkRLb0FwcFUzNElpbWUyeU1yUk12YTdX?=
 =?utf-8?B?dzZTa1c1bE8rWlMxeEtZaDArR2Y1eFZLblY5WE5rbGwzdWQxNU92Vmp1ZDRt?=
 =?utf-8?B?RWZEL0ozV2ZWV3RKMlEraXFDNlY2aDBnWFJzQ05BOXhzcFFwSVhsazBMVDVr?=
 =?utf-8?B?OEhKaGpTN2g2WEZhdEcrSEpZSE9NdHlQY3lmWi9oZFBDQXNMd090aE9IR0ww?=
 =?utf-8?B?cUc2a3lER2NLc3FEdkUrb3dDbzhyWm9kOW0xalBSZmdIaklqTnovTjNtanRF?=
 =?utf-8?B?MUw2NDcxRUFnYWs4WjRTOHE1QWVBbS9MVTEzRGY4Nm5OU003WHVjQkQ1WHh1?=
 =?utf-8?B?R2VDMk1VTDgxSFc2ancwMVBTUXhGejRmQmY3bytJOXVsZkl1R1RKWUE3WU5a?=
 =?utf-8?B?K2tJOWxQSCtaZ3U3NmVYd0JVTk5zOVJqYnRYMWJMWE83TjgxVGpkVTA4RlUy?=
 =?utf-8?B?dEtNcEdndS9PVDlQN3MwZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f40fd728-7593-4a1c-d7e7-08d8ef9d1aa7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 14:48:51.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Neg4smowrsBK+sdmHRQClxractcy4A5ziPaBTcbgYSGdD6t+YcK49Zajd8xwum6NZRk11YMTsKrl6zw0RwxewQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Wed, Mar 24, 2021 at 05:05:05PM -0400, Boris Ostrovsky wrote:
> Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
> vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
> intended to protect periodic timer during VCPU migration. Since such
> migration is an infrequent event no performance impact was expected.
> 
> Unfortunately this turned out not to be the case: on a fairly large
> guest (92 VCPUs) we've observed as much as 40% TPCC performance regression
> with some guest kernels. Further investigation pointed to pt_migrate
> read lock taken in pt_update_irq() as the largest contributor to this
> regression. With large number of VCPUs and large number of VMEXITs
> (from where pt_update_irq() is always called) the update of an atomic in
> read_lock() is thought to be the main cause.

Right, seems like a very plausible analysis.

Since I suspect most (if not all?) of the performance regression is
from the read_lock in pt_update_irq I think we can remove that without
doing such a big change to the current locking logic, and instead
merging part of the logic that you detail in the cover letter without
moving to a per-timer lock.

> Stephen Brennan examined the locking pattern and suggested using a
> per-timer lock instead. This lock will need to be held whenever there is
> a chance that pt->vcpu field may change (thus avoiding XSA-336
> condition).
> 
> Suggested-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

So while I think this is indeed a working solution, I'm not convinced
we require a per-timer lock, I think we can find some middle ground
using both a per-domain rwlock and the more fine grained per-vcpu
lock.

Basically for type 1 accesses (pt_vcpu_{un}lock) I think we can safely
drop the read_{un}lock call, and remove the performance bottleneck
while slightly adjusting the functions that modify the per-vcpu timer
lists to take the per-vcpu locks when doing so.

I've tried to convey that in the comments below, while also pointing
out some suitable places where comments can be added based on the text
from your cover letter.

Overall this should result in a smaller patch that will be both easier
to review and argue in terms of inclusion into 4.15.

> ---
>  xen/arch/x86/emul-i8254.c     |   2 +
>  xen/arch/x86/hvm/hpet.c       |   1 +
>  xen/arch/x86/hvm/hvm.c        |   2 -
>  xen/arch/x86/hvm/rtc.c        |   1 +
>  xen/arch/x86/hvm/vlapic.c     |   1 +
>  xen/arch/x86/hvm/vpt.c        | 122 +++++++++++++++++++++++-------------------
>  xen/include/asm-x86/hvm/vpt.h |   9 +---
>  7 files changed, 74 insertions(+), 64 deletions(-)
> 
> diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
> index 73be4188ad41..d83e727ff35e 100644
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -478,6 +478,8 @@ void pit_init(struct domain *d, unsigned long cpu_khz)
>      if ( !has_vpit(d) )
>          return;
>  
> +    spin_lock_init(&pit->pt0.lock);
> +
>      spin_lock_init(&pit->lock);
>  
>      if ( is_hvm_domain(d) )
> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
> index ca94e8b4538c..c7f45412164e 100644
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -734,6 +734,7 @@ static void hpet_set(HPETState *h)
>          h->hpet.timers[i].cmp = ~0ULL;
>          h->hpet.comparator64[i] = ~0ULL;
>          h->pt[i].source = PTSRC_isa;
> +        spin_lock_init(&h->pt[i].lock);
>      }
>  }
>  
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index e7bcffebc490..b60549a12a33 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -658,8 +658,6 @@ int hvm_domain_initialise(struct domain *d)
>      /* need link to containing domain */
>      d->arch.hvm.pl_time->domain = d;
>  
> -    rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
> -
>      /* Set the default IO Bitmap. */
>      if ( is_hardware_domain(d) )
>      {
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 3150f5f1479b..6289d972bb67 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -842,6 +842,7 @@ void rtc_init(struct domain *d)
>      }
>  
>      spin_lock_init(&s->lock);
> +    spin_lock_init(&s->pt.lock);
>  
>      init_timer(&s->update_timer, rtc_update_timer, s, smp_processor_id());
>      init_timer(&s->update_timer2, rtc_update_timer2, s, smp_processor_id());
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 5e21fb4937d9..8413e41a7a80 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1626,6 +1626,7 @@ int vlapic_init(struct vcpu *v)
>      vlapic_reset(vlapic);
>  
>      spin_lock_init(&vlapic->esr_lock);
> +    spin_lock_init(&vlapic->pt.lock);
>  
>      tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
>  
> diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
> index 4c2afe2e9154..36d4699a5de6 100644
> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -153,32 +153,16 @@ static int pt_irq_masked(struct periodic_time *pt)
>      return 1;
>  }
>  
> -static void pt_vcpu_lock(struct vcpu *v)
> -{
> -    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
> -    spin_lock(&v->arch.hvm.tm_lock);
> -}
> -
> -static void pt_vcpu_unlock(struct vcpu *v)
> -{
> -    spin_unlock(&v->arch.hvm.tm_lock);
> -    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
> -}

I would keep those functions, and just remove the read_{un}lock call
from them. The places where pt_vcpu_{un}lock is used matches the type
1 accesses listed on your cover letter, so I would add as a prefix to
the functions:

/*
 * Functions which read (maybe write) all periodic_time instances
 * attached to a particular vCPU use this locking helper.
 *
 * Such users are explicitly forbidden from changing the value of the
 * pt->vcpu field, because another thread holding the pt_migrate lock
 * may already be spinning waiting for your vcpu lock.
 */

> -
>  static void pt_lock(struct periodic_time *pt)
>  {
> -    /*
> -     * We cannot use pt_vcpu_lock here, because we need to acquire the
> -     * per-domain lock first and then (re-)fetch the value of pt->vcpu, or
> -     * else we might be using a stale value of pt->vcpu.
> -     */
> -    read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
> +    spin_lock(&pt->lock);
>      spin_lock(&pt->vcpu->arch.hvm.tm_lock);
>  }
>  
>  static void pt_unlock(struct periodic_time *pt)
>  {
> -    pt_vcpu_unlock(pt->vcpu);
> +    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
> +    spin_unlock(&pt->lock);
>  }

I would leave the rwlock on this pair of functions, and add the
following comment as a prefix:

/*
 * Functions which want to modify a particular periodic_time object.
 * These users lock whichever vCPU the periodic_time is attached to,
 * but since the vCPU could be modified without holding any lock, they
 * need to take an additional lock that protects against pt->vcpu
 * changing.
 */

>  
>  static void pt_process_missed_ticks(struct periodic_time *pt)
> @@ -228,7 +212,7 @@ void pt_save_timer(struct vcpu *v)
>      if ( v->pause_flags & VPF_blocked )
>          return;
>  
> -    pt_vcpu_lock(v);
> +    spin_lock(&v->arch.hvm.tm_lock);
>  
>      list_for_each_entry ( pt, head, list )
>          if ( !pt->do_not_freeze )
> @@ -236,7 +220,7 @@ void pt_save_timer(struct vcpu *v)
>  
>      pt_freeze_time(v);
>  
> -    pt_vcpu_unlock(v);
> +    spin_unlock(&v->arch.hvm.tm_lock);
>  }
>  
>  void pt_restore_timer(struct vcpu *v)
> @@ -244,7 +228,7 @@ void pt_restore_timer(struct vcpu *v)
>      struct list_head *head = &v->arch.hvm.tm_list;
>      struct periodic_time *pt;
>  
> -    pt_vcpu_lock(v);
> +    spin_lock(&v->arch.hvm.tm_lock);
>  
>      list_for_each_entry ( pt, head, list )
>      {
> @@ -257,7 +241,7 @@ void pt_restore_timer(struct vcpu *v)
>  
>      pt_thaw_time(v);
>  
> -    pt_vcpu_unlock(v);
> +    spin_unlock(&v->arch.hvm.tm_lock);
>  }
>  
>  static void pt_timer_fn(void *data)
> @@ -318,7 +302,7 @@ int pt_update_irq(struct vcpu *v)
>      int irq, pt_vector = -1;
>      bool level;
>  
> -    pt_vcpu_lock(v);
> +    spin_lock(&v->arch.hvm.tm_lock);
>  
>      earliest_pt = NULL;
>      max_lag = -1ULL;
> @@ -348,7 +332,7 @@ int pt_update_irq(struct vcpu *v)
>  
>      if ( earliest_pt == NULL )
>      {
> -        pt_vcpu_unlock(v);
> +        spin_unlock(&v->arch.hvm.tm_lock);
>          return -1;
>      }
>  
> @@ -356,7 +340,7 @@ int pt_update_irq(struct vcpu *v)
>      irq = earliest_pt->irq;
>      level = earliest_pt->level;
>  
> -    pt_vcpu_unlock(v);
> +    spin_unlock(&v->arch.hvm.tm_lock);
>  
>      switch ( earliest_pt->source )
>      {
> @@ -403,7 +387,7 @@ int pt_update_irq(struct vcpu *v)
>                  time_cb *cb = NULL;
>                  void *cb_priv = NULL;
>  
> -                pt_vcpu_lock(v);
> +                spin_lock(&v->arch.hvm.tm_lock);
>                  /* Make sure the timer is still on the list. */
>                  list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
>                      if ( pt == earliest_pt )
> @@ -413,7 +397,7 @@ int pt_update_irq(struct vcpu *v)
>                          cb_priv = pt->priv;
>                          break;
>                      }
> -                pt_vcpu_unlock(v);
> +                spin_unlock(&v->arch.hvm.tm_lock);
>  
>                  if ( cb != NULL )
>                      cb(v, cb_priv);
> @@ -450,12 +434,12 @@ void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
>      if ( intack.source == hvm_intsrc_vector )
>          return;
>  
> -    pt_vcpu_lock(v);
> +    spin_lock(&v->arch.hvm.tm_lock);
>  
>      pt = is_pt_irq(v, intack);
>      if ( pt == NULL )
>      {
> -        pt_vcpu_unlock(v);
> +        spin_unlock(&v->arch.hvm.tm_lock);
>          return;
>      }
>  
> @@ -464,7 +448,7 @@ void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
>      cb = pt->cb;
>      cb_priv = pt->priv;
>  
> -    pt_vcpu_unlock(v);
> +    spin_unlock(&v->arch.hvm.tm_lock);
>  
>      if ( cb != NULL )
>          cb(v, cb_priv);
> @@ -475,12 +459,34 @@ void pt_migrate(struct vcpu *v)
>      struct list_head *head = &v->arch.hvm.tm_list;
>      struct periodic_time *pt;
>  
> -    pt_vcpu_lock(v);
> +    spin_lock(&v->arch.hvm.tm_lock);
>  
>      list_for_each_entry ( pt, head, list )
>          migrate_timer(&pt->timer, v->processor);
>  
> -    pt_vcpu_unlock(v);
> +    spin_unlock(&v->arch.hvm.tm_lock);
> +}
> +
> +static void __destroy_periodic_time(struct periodic_time *pt, bool locked)
> +{
> +    /* Was this structure previously initialised by create_periodic_time()? */
> +    if ( pt->vcpu == NULL )
> +        return;
> +
> +    if (!locked)

Coding style: missing spaces.

> +        pt_lock(pt);
> +    if ( pt->on_list )
> +        list_del(&pt->list);
> +    pt->on_list = 0;

Please use false here, since this is a boolean field now.

> +    pt->pending_intr_nr = 0;
> +    if (!locked)
> +        pt_unlock(pt);
> +
> +    /*
> +     * pt_timer_fn() can run until this kill_timer() returns. We must do this
> +     * outside pt_lock() otherwise we can deadlock with pt_timer_fn().
> +     */
> +    kill_timer(&pt->timer);
>  }
>  
>  void create_periodic_time(
> @@ -497,9 +503,16 @@ void create_periodic_time(
>          return;
>      }
>  
> -    destroy_periodic_time(pt);

Why not keep the call to destroy_periodic_time here?

> +    spin_lock(&pt->lock);
>  
> -    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);

And the write lock here together with the pair of locks that you add
around the addition to the vCPU list. Those would better use
pt_vcpu_{un}lock if you agree to keep those helpers.

> +    if ( pt->vcpu )
> +    {
> +        spin_lock(&pt->vcpu->arch.hvm.tm_lock);
> +
> +        __destroy_periodic_time(pt, true);
> +
> +        spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
> +    }
>  
>      pt->pending_intr_nr = 0;
>      pt->do_not_freeze = 0;
> @@ -543,33 +556,22 @@ void create_periodic_time(
>      pt->cb = cb;
>      pt->priv = data;
>  
> +    spin_lock(&pt->vcpu->arch.hvm.tm_lock);
> +
>      pt->on_list = 1;
>      list_add(&pt->list, &v->arch.hvm.tm_list);
>  
> +    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
> +
>      init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
>      set_timer(&pt->timer, pt->scheduled);
>  
> -    write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
> +    spin_unlock(&pt->lock);
>  }
>  
>  void destroy_periodic_time(struct periodic_time *pt)
>  {
> -    /* Was this structure previously initialised by create_periodic_time()? */
> -    if ( pt->vcpu == NULL )
> -        return;
> -
> -    pt_lock(pt);
> -    if ( pt->on_list )
> -        list_del(&pt->list);
> -    pt->on_list = 0;
> -    pt->pending_intr_nr = 0;
> -    pt_unlock(pt);
> -
> -    /*
> -     * pt_timer_fn() can run until this kill_timer() returns. We must do this
> -     * outside pt_lock() otherwise we can deadlock with pt_timer_fn().
> -     */
> -    kill_timer(&pt->timer);
> +    __destroy_periodic_time(pt, false);

I'm not convinced you need the __destroy_periodic_time helper, I'm not
sure I see which benefit it has over the previous approach. You end up
reading pt->vcpu without holding any lock in the destroy case, just
like before.

>  }
>  
>  static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
> @@ -579,15 +581,25 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>      if ( pt->vcpu == NULL )
>          return;
>  
> -    write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);

As suggested above, I think you could leave the usage of the
pt_migrate lock together with your addition of the per-vcpu vpt
locking.

As this is the most obvious function that changes the vcpu field I
would add:

/*
 * Functions which want to modify the vcpu field of the vpt need to
 * hold the global lock (pt_migrate) in write mode together with the
 * per-vcpu locks of the lists being modified. Note that two vcpu
 * locks cannot be hold at the same time to avoid a deadlock.
 */

Thanks, Roger.

