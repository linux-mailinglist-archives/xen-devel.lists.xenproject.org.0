Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C350732F060
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93912.177412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDfY-0006vi-Bj; Fri, 05 Mar 2021 16:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93912.177412; Fri, 05 Mar 2021 16:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDfY-0006vJ-8B; Fri, 05 Mar 2021 16:51:16 +0000
Received: by outflank-mailman (input) for mailman id 93912;
 Fri, 05 Mar 2021 16:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lIDfW-0006vE-Rt
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:51:14 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65ee316a-edd1-44af-8dc9-fea33ad1b892;
 Fri, 05 Mar 2021 16:51:13 +0000 (UTC)
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
X-Inumbo-ID: 65ee316a-edd1-44af-8dc9-fea33ad1b892
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614963073;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V38rJ8g+yoVrKnITUdeIW7NrWR3JYYscW2CC4cywW4o=;
  b=f9utsC7bgYNz3kCrq0mXKmmR4RC/1ASgp/ZC7gTuQAY6J84WnBu/7rFJ
   09UBigJ4dNEyjwUM9WA8TzK6soKVnKACMF70c9g3LcZiXaEc2P/E1NR1E
   SnWNWCpfnA8BjX5C3K2wOe1lLQQiysZjmrnxpLETsyzR3fGUNBnEbjGE8
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DFBKb6zR1OQN+g9jLAE6AzMvo+38z6/ZH+InuM/yGOmM+uZ/iMBTIXvq/klg5Z91yjrkO1AAOi
 3WV9yIpzxAtgUff2XcQ56wYaAgxahSPDif57bA6ZV6rYCxjXwkoBoTG6qsplzGpaWbeoGe5NdQ
 Tg1qVZqbmJUwfbLLpevi4ui+E7IQW+pVurQs2bGKBAzBxMFs7U5e3Y7vCy8Xc5z0Ti4EhTBWSu
 bVhivOFpobI8vo4Tc88MxLHTDgKrDY+w2sqSKQtvK1IvdVZnSJTubPveEJULrNO7/MtmEvhDtA
 6WY=
X-SBRS: 5.2
X-MesageID: 38664311
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,225,1610427600"; 
   d="scan'208";a="38664311"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWV07Wwx3L0LKqLxyTp14pCmw8goRMK3lQ+kurmkuBYsAd7lz1ncrEs8KDoF3ZAm8R01Ebm+qdlB/CymdC8rO2IVYTwLiT9SOMWlvIrOXEA8wz2cbIJrjWo9HcXTxc6x5avHWjwo9IP5m5NKuX9piZ8eG1o8664yQGBFnZxZY+SI+nwHDLaI8dqtxxg7qHbJJ7Egx5j08klE517QnNiFvYBFjuIgwnAFVLB3Adz1BWBZ44624F+g/dnOSLmvDJEcF0dB2hXQAb2TWq1FkCcDBjQbT2IoKZLuNUAP7RhVBN2Lvlawr9F5pZUJoxRK46m/bR39hZqN/f41T539VIIvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V38rJ8g+yoVrKnITUdeIW7NrWR3JYYscW2CC4cywW4o=;
 b=LWX8gaIDBF8tuiNPpXNnTloD2AJfo5IDu57gBOGxJ/Q9GFV2DwGyyspfX358KU7t495meOmtLLq7til+VoZG90w1QeaxHc3clCQUls8yj4vVYG4w94GouNXQHesaWilrZ7gz/iAdmD/uKcBRzyKoz7CC2LOjNfTgBRUjPVZ65tBSjNbJEoWltkpvEvYgkqf2Lv4ppNHu5hWRQDpB6YCGlJqelpyBj9ua9I03eyylz1jztmY/04rPt+w9TkO4VkTzPdTnjhbx3Ds1yYD5RNYc/gBQZsLvV0PD1F9nmVGtAwVDXd4PWAniE9DTKa0WgRKcOfK9E/ruOzphMRNe4fih9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V38rJ8g+yoVrKnITUdeIW7NrWR3JYYscW2CC4cywW4o=;
 b=kE7LFGLIIrQwSg5QHvCg44lie2+Nru4LJ4tHQw/h81pZJ0fU+nEYvVm+U4o/Diqco4hPWDVRxjDT5KdGCcdeREyyVeO1OEGyu0I4+Vc7u+/UJp2+7UFkHEtVWXoQNuKlo1+jcnoou45udIqGRQI5vg0RHzRv9XTxODf4E6ov5+Q=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
References: <dcba50ca-59da-b7e8-f60a-7efd8ecd052e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH][4.15?] libxl/ACPI: add missing build dependency
Message-ID: <4776cb15-8f8a-e185-fdb7-196da4b70cc9@citrix.com>
Date: Fri, 5 Mar 2021 16:50:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <dcba50ca-59da-b7e8-f60a-7efd8ecd052e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a047ee6-4f82-4fae-c08d-08d8dff6d8a0
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3942272C9EED7CFAFCE75CECBA969@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gK907xxYAmVjRbHPsZwWDuliVi7dsrmeJreXwrkUU+zdBueeFHrWmDRtoclv6LLRf2bg1qny7ayuUmpX9ITtEAqmcB10Ghg2eskXXG8E2Dln9m8tBKR2TiYDclkURkQgBdRn7270Gm8d7/403PjmrcAsHaQGniJZd9Hub3Awqp9BjMnJigy2XJiMaMHzgfZYWqK4RcZFQUtlcizVAhB1xw0wx1p2T2GmXLRhNc+Dmhcy9uC5hCgji/2LAkj+nuO7IcWFRo7MyjSEcKDPHTds5TKzVQ1x5Ni+s+367amesGn7C1uxP860GzvYfZHkwiStzxv/5sxLF4Ol//wjtZIjzLlrpelfoGr5vLpL+hJX0IlnXfI4YFZKM8nERS4SRy3hZKATUp0umaqCwo/ifTRjoitV3JTOPybiUgZ8+J8hFDRvt1h/2C+hz6eeWB8Ov3YcmhUXL9vrsVEF7jOioEZ5J+NDZiH5jbDlTlXsQkNwW7TIIVlDgFeo7t/mBVv9+blDt5SyJSlWMeAkFbMBzlbvgqmUakVHqZzQwzPaUkthVzo7Sm1XWxMeFZfilxpgU1uAKMII7uy1DaWRajvGUuhmV1SdEGRWbZxVLgRXLEVUUnmOiy3y1hXHXATNAymrYGmT/bqb5YEU0siqoSt05ifM4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(2906002)(6486002)(316002)(86362001)(31686004)(54906003)(66476007)(16576012)(26005)(83380400001)(956004)(36756003)(4326008)(5660300002)(31696002)(2616005)(66556008)(110136005)(6666004)(66946007)(107886003)(186003)(4744005)(16526019)(478600001)(53546011)(8936002)(8676002)(11771555001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UHdML0RZQ1lsOU9QMndaZ1p1VG9BUlZMNDBkRkFyRjkxL2tNMzFYQnJMQk1p?=
 =?utf-8?B?SXFrdUJnVFZ0V3R6bUlNOWlDOHY5anBDdFQ3eEU3K2hkekozeXE2azY2dW1a?=
 =?utf-8?B?eWZQdTByVFRHclZ6Zy8rQUY4dWlQQVRmeGJQMnNxcDVoSExCdjVROVRSY0FO?=
 =?utf-8?B?UVNXakZDK3gvZEdGK1F6OVJ3YVdoWDhubHFHWmlIVFdodngxQWVFUGxzWk9G?=
 =?utf-8?B?N1lKa0JLOEtSck1CU25WUEtiTE1kRlN2bkNwbk5SbVE0QmNCQlNwN1g2U2wr?=
 =?utf-8?B?WEhxaVJDWi9Vam5nR01wWjF2bjVibkppcUY5WU55ZVgxNHByY0MzeFI5U2d1?=
 =?utf-8?B?cW80Q21Ec3BCUnJNU0FHVEorZUZwcGhlM0REQnQrbVBld0p0YjI4cWRjUUdp?=
 =?utf-8?B?TmxvSTRnSkxscTlJamVyMitvZk5EY1p1VnZwMFE3V2dLTXFQS0FUbWRVVkt2?=
 =?utf-8?B?REU2cTk5ZDA4czA1NUxGV2RpZE81ZTJWYkhKc2lEWlFpMlQ1Ny9FTkZtN1Ux?=
 =?utf-8?B?WUZNWXVjbUIyb2pLVlVxQUdKOEtDR0hlZ0hseUxlTmNaSjdHbGNIU1Mzd0Er?=
 =?utf-8?B?N0FMbUFaalNCaDNxejlUc2s5UmJreW1xOEVEYnEzeitkRXZ3Zi9Ick5nOC84?=
 =?utf-8?B?VnUzM3Y4NkhNL2xYVkRRMDhKeDhaaFVnL3ZFVUpYWEU0amxTUVI0YWNEYTQz?=
 =?utf-8?B?aHFrMDlJNWszVGlwZ0dFK2R2NjZ3QXAwajZJSm9NQTF6TWZpL3NrT2k4Qmd4?=
 =?utf-8?B?VFNsUTg2QjI3UE8yblBhVzhSZ3dVRVAwV29nV1h6UkxwdW81cFJQOE5sYU5O?=
 =?utf-8?B?KzUxTXkwcVBNSWtWb2tYQWw3b0xqNnFKaFV6VzZDTEFXS3h1UW1haWxJYmhW?=
 =?utf-8?B?RUIvbVFoTThQcENxYUloM1libjdielJFeDVOTU1yeVRoaUEvOUlpZWVXYk1q?=
 =?utf-8?B?emVrRU9OYlBsMm9vVGdHd2xkSW9PVkFyQ0w2T210Z1c3WkZoTGhudk51M2Vi?=
 =?utf-8?B?QjRNU0JsRW1rZnJVQUNhSTBJNVlJZU5HMERqSVNaTnRCMUM0UkNHbjU1M1FQ?=
 =?utf-8?B?YWwvaHlOVTBpTXczMW9uWWJyZHh4dUpodzVWaFpUdTFUZ00rR0hYbDlsNUp3?=
 =?utf-8?B?U3NCTTN4T3RXWlE5QWhNTmFnWlNVaithOU1ISFRwaE5MWEhmaDV4KzFVQnJZ?=
 =?utf-8?B?OWRtcDdsdFg1d0M3bXBnSlpoZk11Zncvb0NoMGZUQm4rMnI5bDgrdHN5cjF3?=
 =?utf-8?B?OEFyeTVEWk0vZW1kdE9QTmU0THFaTm5xZmFHY08wVWhYQWpJa25YQ3g2ZnlY?=
 =?utf-8?B?WklpQ3B4TnRmQkg4NWN0NTh6VDQ2TG4rcVJwRDJUY2RQZDRJTFNSMUF5dVcz?=
 =?utf-8?B?RG9mVW0yNlVGTU9Kem9UcXFEbjd3Uk1nSE1oZ3BPTys3elNuWGRDYmVUSnZO?=
 =?utf-8?B?L1YwRWNpNFBNZjdINEZ3ZTN0Rjhmbk1hTmN1bVBSVFZDeTRQYU1JcVoyNkFU?=
 =?utf-8?B?YjFTTjMxZVZaVnd1SkRRZWF4Z2lNaTJrcTZkbGorczQwQVdDUmg5UWdpN1Iw?=
 =?utf-8?B?S1dBTnh6L0NUZGl1VlhYemlRajlpbkJpelUvdXJFT0tmTE94WDZmWldLMnds?=
 =?utf-8?B?emo4SXpma0JLTlVOMUlRL3pqSmdIMjFsTEplc3hDWXluZ24xQ3ZrS0pOZHFZ?=
 =?utf-8?B?ejJKREZaYU05ZjFQb1NkYXF1SHpXTUtFS2hlQ2tROG9uQ0NtZ2RNeWZab0hF?=
 =?utf-8?Q?fYisgy9fuI0G8Xm+/ONiJwmvNb1ofpefT0KQGG6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a047ee6-4f82-4fae-c08d-08d8dff6d8a0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 16:50:56.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJgPgJNdxhmMIJAk0YAPlsiXzSfmtTPK4N9qubytylY2Y3m+Z/OLyeIM6R9MtEvRBEpHkoXpVvkZpJT6Tw6elGqyy5RmHlm4XpvhXhhd97g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

On 05/03/2021 16:28, Jan Beulich wrote:
> Just like all other object files - wherever *.o is mentioned, *.opic
> also needs mentioning to yield consistent behavior. Otherwise make may
> decide to (re)build the object before recursion into $(ACPI_PATH)/ (to
> update $(DSDT_FILES-y) and ssdt_*.h) was actually finished.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


