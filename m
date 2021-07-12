Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8113C6733
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 01:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154917.286110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35jb-0005EE-QC; Mon, 12 Jul 2021 23:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154917.286110; Mon, 12 Jul 2021 23:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35jb-0005CI-Ms; Mon, 12 Jul 2021 23:53:11 +0000
Received: by outflank-mailman (input) for mailman id 154917;
 Mon, 12 Jul 2021 23:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m35ja-0005CC-Pc
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 23:53:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6818a19a-e6e9-48b0-bb9d-2498e63d99fb;
 Mon, 12 Jul 2021 23:53:09 +0000 (UTC)
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
X-Inumbo-ID: 6818a19a-e6e9-48b0-bb9d-2498e63d99fb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626133989;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UkqL6zHJ3SCgfJ274ZhKSZmHWvAVbXLTCX5GOxIG018=;
  b=Axh1MsvX+jZ47R7kqGOwFmS/gLIPp/hDPoLXP+Bi/8ppsLxhLh2FtKaV
   IUqxeeevnYJlvdZYCmlJf649gJ/tz3fMxeuJir9+d/R058NgJudITmrUu
   O8KzeBKpLek/oamT2Smhidh6FTbIVtr9ggg2WlSXKutmkNHJPzl6a8csS
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hw6WYGGxZPbfIjCO9AUg6jfyLXbV+sAhwm6HoprnQxPMu3BiXpeuePKlzpMcspC7WKCE0kM7LY
 x8rBQWfButEA3ATfEi32AEFvi7ceF5Yoju/ql6Fu7RMgKP5TxiSfvf4bfs7ccPVTge7ZZq6hdd
 CkXHCD2CplAwkeoeSTox8OHFWjw3YEm160IiPeizWr+DFCwRkhqjEJm8K8yF2iLB08opTaaakQ
 QsiT3iSdDFWSo2YQYNIE6wOw/7rT2QT1IXHF1pEeyEAlw+jd8yDhnwWbtiLpWuoQvWqkNr7KnW
 L6M=
X-SBRS: 5.1
X-MesageID: 48172651
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:w+X3uastIATg++8gtVT7aSzs7skCmoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcH2/hvAV7EZnibhILIFvAe0WKG+VPd8kLFh5ZgPM
 tbAs5D4ZjLfCJHZKXBkXmF+rQbsaC6GcmT7I+0pRcdLnAZV0gj1XYfNu/yKDwGeOAsP+taKH
 Pz3Lsjm9PtQwVtUiztbUN1IdQr6ue72K7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhCP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpE/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBrZgxSGqb12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsZl/IJhXA3a/pfVFZol/1bwKppKuZFIMqjg7pXV9
 WGTfuspcq+SGnqLUww5QJUsZqRth1ZJGb0fqAA0vblmAS+0koJlnfxaaQk7wE9HakGOu15Dt
 L/Q+xVfYF1P7orhJ1GdZA8qOuMeybwqEH3QS+vyWqOLtBPB5uKke+u3IkI
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="48172651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnAMUB6soGEHm30BA328/ayLAPFEbkuJQR4M5LpGCu85yAocWS4wIqc6P6/hgk3kE4PfvGzrJyFGrxYZOJlPhjJnMgwQVdXGHMKETeZEnf5FB7ZYdKkmlILuYeN59z7o1DI+dB1vfk+3uUG6h96yhMn/TUlJyDwb690tk6/lv3TPphK+VoLLhsyAqQRBTe/MAHgRpfmQ0OvXk+1T1rzvn/0h/giQZrY8IOWp0AS4LOD8BjA0LyYHetpqmj85g3IifF30gfZsetpQsz68KTiDOEBRJaJt5G/qit65slM/MjuEFMytH80gc7bNbrz7ENu0XJk9DL3PqfbMmjbUY2qsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkqL6zHJ3SCgfJ274ZhKSZmHWvAVbXLTCX5GOxIG018=;
 b=ccfDPwEFKWvh7Ncyy1UyftEVU/UHrzUGS6LWjAgels6PDOsau1iPhp6wklMqMnVeNSW45TPQkUNatHThFthFtO+ir1bemiO6uNp6tko9kRKS+F9Sr0Okb6vaOxJAHU06pBRWqsSdCeBOdclnneBvjPRZMA5rgQ6iF4s6PQSdNiJvGUN+o9NochrSv1rDXhuf+8oaze65EkOJzlAwsYRzIN4XAM0a/Vi455s/MMQkD4x6JVneqNtLixwfFociyuTPnua3T5jG97d3lwY/hdgQc+zr3ynFf2qQAzDIll+yxyz5X2uHPF0l8B+TuSVhQvUXM9ay3SBePCYHx5bkg/Vn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkqL6zHJ3SCgfJ274ZhKSZmHWvAVbXLTCX5GOxIG018=;
 b=FLY/G1sIMFRiYZVUh+YuslFW4piJ8+/NSKP9q/Jj1lsw8GU3+km5NMspkIpXGegdxigiQCzJajCoGNPj+QlJk8+lAVQvgBOyrPo2oJc2dnK97hiGRcdUIS9ok3Y8Hn8qHtmVIWyYbKByg+t2XsK1XT1JR6O8iNHWph8cQP5w99E=
Subject: Re: [PATCH v2 07/10] xsm: drop generic event channel labeling
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-8-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <223bef6d-dc64-8353-af8c-357637b88f4b@citrix.com>
Date: Tue, 13 Jul 2021 00:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0381.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7b8d1b8-1d0d-4c70-cbd4-08d945902f8e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB349578D268DC80EE937B6D85BA159@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObSkpcxSZi+QEsfbMto9bPLT9dmmcnTizNSquJl+NvwBJ4GDB25RjlB/kIRAiTT+lyJoAKwwqmyjfAqxwNb5XDuyw0sGe3EGuNWv6FPrk1fYteJckXgMfKasB30sW+wW7KmwzUdMObkzV2pBBnkkILfj0jb0KgEltXYhdRvKMYqoLOUhkR03MBqnTAAOnl8NFnfm8Wuz6firXDojE4CmMVTwZgaB7nV0ZsmrLXBRfMHFoEMVPuTOrxAZXOvdwiUaqnLyuZ2jnIXuRou4F1iTam2sWbmz4ga1p8LKLjTXKGrLFBZi2qdXpaCCfBFqFOOG8Z8s1GiTI+RDb3b5r2uRTKOKCOkF5GmZPatdbEFAMijgZrbjvh7VBiOgdX6bPC8pScmBpX5fI5TK/sB5xeotnv+Dth08UjcOTTg/OjDgXg+Nv+DH5mmR/+uTla4fqOrGS1djAJO4PZaRVIuWa0odSrZdykdWoMfVMibp+48MPo6OdMgpDWDT2WeonqqfzuN5yI5y5fYCvcJr6u086F3zrASPFM+tck7m32x+PKG+FSHVWoGdLSx6wjsvmpt9ck6xBCc6JbtATe7K3dIATYoaJKploWUJmdSpZ5h3/1Xa/HasMCUqlDojp2m8AjJSQU62eXNliOfa7CzxUV3gOP53OBn51cP0gZCgkDA3s8AP3RQcSfVumotJKrEUDtQMeiI+96G1kYpjg7HB3TP2zodJM3XyX1LCwqslZUEvxnBePavHo5Vo6YEJZmsl9qpb20tfoAkI3iRls5HLDeZILyquCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(5660300002)(86362001)(186003)(53546011)(66476007)(66556008)(26005)(66946007)(36756003)(31686004)(31696002)(6486002)(83380400001)(16576012)(4326008)(6666004)(316002)(8676002)(478600001)(8936002)(956004)(2906002)(2616005)(38100700002)(54906003)(4744005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2tUbUZOUXAwVDk4V3hlQ2VzVFB5bnh0YlUxRUpwdzdpMVBQT0NJQ3M1Mkxa?=
 =?utf-8?B?Q2pjUXdWSTFGN3pHK0ZXY284Q0JRd05zcCszZm9DbE90aUN1Zm5BMld6WHAr?=
 =?utf-8?B?YU1FeExtQ09RcUxhb2xLLzdLNkZuMmJFNVRhTlQ4clJHT2dUamYvZ0Jwc2Zz?=
 =?utf-8?B?d0FxYjhXTVNRN2JiTWpMQWtrVHd4djFMcVpWQS8rMWZuVHljZkRSbzVNb3Nw?=
 =?utf-8?B?c01YTjR3SVJqSnVDLytsLzZ5RmVtYytsQ2tESzZCZHNTQnM1d0tYQ0FoSktt?=
 =?utf-8?B?Z0sxS0JsTTg2ZDg2bVN6N3V2OHlmSFQybFBJZ050TXo3OHEyam5uZDUveThr?=
 =?utf-8?B?T2FHbGR1YmUvMlN5TytBSHY3S0R0L1EyQnM4aEZ5VHZraFZuRm52YjJBL3Z5?=
 =?utf-8?B?OHc2Ull2dzJzNm5IUjBOTndnT2QwM3R5MzdIRGE2aVBOa3liZm9XbVEwd0hp?=
 =?utf-8?B?Z2s5R25BS2docVNtR2dhUE5qLy9pdExpZzNXS05YamdDZHgvSXFKVmpHUmZI?=
 =?utf-8?B?TFZTeVluT1BPeVljeFZNb3NPSC9aZm51aFRuYjBkRFJQVThmaHFRblNPQThv?=
 =?utf-8?B?RWdiWHM0bEp2UDBVTmpDNS8zM001Mzc5b3JnbVAxanluQjcyYU5aRHdia0hH?=
 =?utf-8?B?b3NsMytDbW1pek55NkRKVE0zK1JVQVdkNWhPOHdZbW1IeWttWHYzM0J3S0Nq?=
 =?utf-8?B?emw3QStvTXZ3UGU1czBJSHh5VTMzQmZuekFZU3p2NHZZT2Q5R0FiYUUyMHJL?=
 =?utf-8?B?UjY0UEh5ZHM4VTJPazYreEx6STFuS0VFei9Wb3Byb1ppYzNTMHJTQjJvYWNC?=
 =?utf-8?B?MGV4RUZiWlpGSjZCV2R5VGtYaFFXbVdWMjdOWldEcjg3R21zeEF3YThKaDlI?=
 =?utf-8?B?UVo3Z2xsT2s5eFBlZWd4S3VzUUd6SVlKdnhsOGJ3ZWtNbGc4Snoxc0ViK0xk?=
 =?utf-8?B?Y2J2RnNIVkRoTHdIRGJheElpVjI0aXFGYjdDZ0d1NGhVek13UWdYVVZzc1pU?=
 =?utf-8?B?K3gwYmg2L1dQWXdaNVBoOStXdURUZmdGMlR0RG9jZllKclRBWEgyRGw2bE5N?=
 =?utf-8?B?WE9JaTdPZFlFbWxwaWdMZmd3cHpOSDYvR3dvTUJjVnY3eFc2TkpzcU9pK3JJ?=
 =?utf-8?B?ZmI2M2lxcUVpUCtXaVQ5aE9NY09vdGV5d0h2c0NvMDBEQ3lYSmZOMVVTWFZn?=
 =?utf-8?B?UXlNckJ2WjFxeThEd3dLNllHMm0yVnRDMUhlZWEyakFEK3cyOTFqOGtFRzJJ?=
 =?utf-8?B?VzVlbHlHbDMxQ1lwaG5KU0xUS3hTMU9GTDI4Qzk1Mk9Rb0VLZThtRUM0aCtp?=
 =?utf-8?B?TUZwaXlvOUVIcEZGUEZkRzN1alhlYWd6a0VMUVdta1ovbS80cTJqNGxmNEEr?=
 =?utf-8?B?RjAzViswdkJTWHhZMXZVbStCMCtPRnJlUU1USjNmWE45RDV6NDVWK05uaUpi?=
 =?utf-8?B?NlhnSks2bVpKNWltRGkwYXo0aldXcVFzckdWZWpHWkFXZk1wMzEwNkR5S0xB?=
 =?utf-8?B?T1FBSFVnVk1HWmYyejQvRzZrbHM2eTRzQmFka2t1MEhkM2pSZGdaNElWb1FO?=
 =?utf-8?B?RG5KTHhBOWxvT2ZJZ3AvWFVkWnhGZTZpSjBEQ1drU2NOaGFvR2s4Q0g5SmRq?=
 =?utf-8?B?QkhGVEs2N1oydFZtMjBLaEFkMTNOR0lTcVFha2xXVno3UFd0TGxnK25NVkxt?=
 =?utf-8?B?V29JeWhGRi9aMlZTdUFWc3NsTU1vMHdlaW9lNGRaTlpVdUxGQWJ3cGhmUTlH?=
 =?utf-8?Q?lPY1KRaV8scQpkzVnrWfY6QYFKGo01UsYKjQqXj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b8d1b8-1d0d-4c70-cbd4-08d945902f8e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:53:02.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8ho8eInd+J5+Yv8gPxCjHRR42h9RrwlD4wFXwuTyZdiyFPgvNgTEAIDyKKzQ6XZ9aVIWhtChLv0s4BRjHAuYw8JAMqw5Wevrpu1A7SdZWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 12/07/2021 21:32, Daniel P. Smith wrote:
> The generic event channel labeling has not been used by any XSM module since
> its introduction. This commit removes the capability leaving FLASK labeling
> field always present. In the future if a new XSM module needs to have its own
> channel label, this or a new form can be introduced.

You're missing a SoB line.

Also, this too would benefit from being reordered higher than patch 6,
to reduce the churn there.

