Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C37310D88
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 17:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81826.151279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83Xm-0003K7-6N; Fri, 05 Feb 2021 16:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81826.151279; Fri, 05 Feb 2021 16:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83Xm-0003Jh-2O; Fri, 05 Feb 2021 16:01:14 +0000
Received: by outflank-mailman (input) for mailman id 81826;
 Fri, 05 Feb 2021 16:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l83Xk-0003Ja-0V
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 16:01:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0dd9cad8-ba63-45ce-a3d4-83261a840557;
 Fri, 05 Feb 2021 16:01:10 +0000 (UTC)
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
X-Inumbo-ID: 0dd9cad8-ba63-45ce-a3d4-83261a840557
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612540869;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tAQoe8/Q8jNI3ywYeerUjvLYjZb7VgWEY06WpUr04lU=;
  b=IX3tpOdqSzDP6kQLfONwQsrTnySQqdEec/IKNvyps2y5rRPzoGwnOoyB
   qR7b5HHv8D4r6PTNwTY53y3B1zWLLKgWYI/2E7SHmhU/tK41l3gl1MEj8
   d8y39Xfl85dLeZwf+oDkZwnwqH/fPO14eKI3sI1+sIZv5c0KgnxRS9Kqo
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s7NeREJ15/eqlvHZBLIfZ8UwVKgHY4HQpaJ92zj5qz8063s7UosZxZ2t9ciD35FpbFyDlcnA7r
 0u4IrFaCIYdPYDpe3lk08ILLhZsauE8/RVDuHwunGrDkSe90eQbzTnMgnB2rowlKSIvW+WL8bE
 EF+GWYfAj9Zhtjtv+jO0lPt4pWwTemi2k/D/Ma8REE10syXWy4Wd9zAM1THBDT3kODxJ3K/ery
 2l+MSd1W+3vcfU2FDpOl0siLwHr8jnKmmLFzyxyM2kjBB8ERRSG5K5rh890fz9iMqsSXTl1c+r
 WYs=
X-SBRS: 5.2
X-MesageID: 37028792
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="37028792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQzgG0hey/9oMcUA7AaP+AdN3yNgpUyw/RMSYOkLaAoQelb3GjudQZbM4YjOxsolmB47ehquLn3WUG59rE6qBCbbyu9HDAEutQ6yDw5zTdYSu6JGJrdgcStpufux4vb9akk66RCzUMczSYSx1iCRhz4k/dwRIWxaBQWPRjGl2KrR3ud3YgkVR7TH9wy8IhLl4bodgXgj3pfB2VQT1b4LdF8TePqRb/m7T/1EYhHkQxnzxZTicrtQN7S1zTVAb2s/a11EXoT1v6eQ+s/268oz6M0gjUl/SowXu+NK2t8fMTgyZOeGqrp2cyoO52RewjQDH/c6DCp8mb22wL1sB6TpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT4NKIPVR/ucz9aEFjx9b8PXYVT84ee6W2JYqmSQNKA=;
 b=FKp4Ij/Xo8DnR5Rzk5XZb+l9l1mm/dtGvOtk2STnFa3atJNovmUWLoZ1D9dQX+Dbxyx55F/IPxIuagBromXLE82AVRrRMl/ocZwnvbOtk5Y5WP0FaqXm3nQyyNdveRcv3Mw6ZoSQP7Bwk4z6zu3vQtH0j4RwXC6hiGJpV0mMJPb85rlGH4REaV9iRQ8/40bHON4qI8mIzj5RdxKB5AVeryRjsiUJX8bvDVEhSgMpNmLLYT8yBa4hNTuTY13WiXeew/hVrpUij+ihicntVvsvHy433PfGS5ej2aB6/gf85bGR7sa/WmiI7Zk0VG/iTuJp35UuOFgCQN5Wdf61P3Suxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT4NKIPVR/ucz9aEFjx9b8PXYVT84ee6W2JYqmSQNKA=;
 b=FWID/K6xiBm+8mX0ac9936r+0ftnGMUXCFs8Ul97G9TPgDa7/0mX4msfLiD8qSDMbmemmkqrLl4rh7rGP0/LvLPC6+30B+0o191EgPzj75mEPgrug6dCkvjOI2iDONZOzTWqykBMmIrYufO0iEiNKEMASHHMOc8BNFWmjZskMgU=
Date: Fri, 5 Feb 2021 17:00:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 1/3] x86/time: change initiation of the calibration
 timer
Message-ID: <YB1rt1LNXuhpQNZC@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <ca624e2e-5a2c-e2a6-6e26-54bc3ac7cc19@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca624e2e-5a2c-e2a6-6e26-54bc3ac7cc19@suse.com>
X-ClientProxiedBy: MR2P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::27)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d40efb7b-088d-480f-4a7f-08d8c9ef3b83
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB263689D20E50B271641A01158FB29@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vw5kRnu/PEWgFPcDlSZdgLQHnKc8/dLCSjGbM01wr6V9EvAZwFVG4R5y88JNIGAQUrgtjlmEw3eRMHbuZXTYGDBFcTumekbAHCwMg7ybcsNQyUnug4gnIR0eETEC/2HxWiLbCN8IjzP9BK2wAAMsl9Ri3FUmBc+TOdeOL1FMvi7MiD7xccr3fQly/7+90zCgz5rtzsOU1hnjDIKahW+t0jNdlUg2IpUeYN8HAPTGZUvzZ8qdigiax7dXAkPdfpsoSVv8++cDr4JfDssguIy8A+DydEfEXzZPhi7sT7oyy9O2XVJAqsAG61CWEZ2JR0ewu1xklvT5Bl3nrVBYc3VE5CYMvYjj91F9kW6cq4mooYG2d8e+lyJA75sCid5hbACKEo++uq1YuuLkELTtI5s8U1N5LfR6OK3gGbrGb11PsiL5btEDcpIXVHY+CNX3QTz+/f4yNh5u+6Nmmk+QykXvIRiA07L42THtDuhhgQq2ULVdCAijfkYSbPfiSqmAG7wYwhAngYd+p2Dq2yqCIfCA4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(39860400002)(376002)(366004)(136003)(86362001)(6916009)(66556008)(6496006)(9686003)(2906002)(5660300002)(4326008)(33716001)(54906003)(8676002)(85182001)(6666004)(956004)(83380400001)(478600001)(4744005)(66946007)(316002)(186003)(66476007)(26005)(8936002)(6486002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXpjM0Zud1VMeVgyQUJob29WbGhoR0l5dGdkclFUeTNGU0VFclllY1RUUUxh?=
 =?utf-8?B?OTU1SGN5aUEvbFc1SkxkNElwV3MvcmJ4RndJaHJuYTYrQVliTnM2OGEvWTg4?=
 =?utf-8?B?TFBmclZ1QUVsclB0aUNkQndwcHNGMXNTdWZDVWxxM1F2OFFsaUkyeFNDTzFS?=
 =?utf-8?B?ZmVZbUxKSGZQcnJuNkhTZ0lQU0hYZkw4TGVMbktCMm1OYmVvZnNmVG9WamE3?=
 =?utf-8?B?N2I4R0RTVmt1ZXczUnBra2VOcHZJaGJLV01Jc20rTnZoem8zTUpGeFdOREJt?=
 =?utf-8?B?SHdpdENBWllITXd5aWxGMUdmcVl5N2RKRWkvN0k2ZjRXMFd2T1AwaERnWjNy?=
 =?utf-8?B?M0JuRUIyb1loRnNMNlQ4ZzVBeldVek9uaUc1NTFBclN5aFprdDZVS1RRTlRV?=
 =?utf-8?B?OUJYZEZlajB4RFdmRW9Nc0tXdkNTK3dranBZdm5kSHFXQkpoMG9XNGpDQXV3?=
 =?utf-8?B?L3piZEtFazVHQ1doVUdrME9KcElpWEZFT3E3UmxFaWp4OEFQMUhOY0tjdlJo?=
 =?utf-8?B?ZjhHQm14cEgxMjRqbFZIdlppWkc5T05EN0Q4V1FiOXlIQmRWaTh4VENHTllq?=
 =?utf-8?B?cGxOUDFmc0xhMjh2K1Y0eWJYT29wbURvZFg5V0FaN3U5T0dQcTc4MVZ1MFlU?=
 =?utf-8?B?eC91N3NveUdWbFFKaElkbUZXbTdyY1B5b25jT3B5VDY0MGJqVldZbjRoRzNr?=
 =?utf-8?B?Y2lOOVZVcFpENVFYTFNzcmVCeDhVRUlMRG1RTm5OaWU5UTUwa2FFcHhNRHlO?=
 =?utf-8?B?cmM3RUhES2xSL0JnYkRTaGZPWTVFeVphY00wNzg0clEwdkJ5SFZQbjJuQlhu?=
 =?utf-8?B?Z3cyVHFUbVVjd1l1RzFncUtBVEpwN010OUFWbDhrVTFTRFdCdlY1cmM3NVFE?=
 =?utf-8?B?QXhvVXJmQnB2Z0QvcVVlQy94bFByOUFldnZENVNlVmNka2hqdEZ2blJJUHlP?=
 =?utf-8?B?ZW5kUGRWOGdlQ0x6VW1uVi9QTjZhWDlsaElSNXlJM3B0c3BaaE1OUzlTS3Bm?=
 =?utf-8?B?d1p6aUxMNlZzR0x3V2xMUGNNKzRLS2I4VjZ5U1VkZ1hWM2dTR0h3bEo1YkI3?=
 =?utf-8?B?SkpPdHgvUFVwQTVibkNJaEozaUlEUHNTc3hvUlFDUDhLL0xGdUVnK1h4akli?=
 =?utf-8?B?NjNFMjM0aDdUYWwzSTMxRWdSSFZsbzgxd3ZGd01nNEU3S2JZQ3F0Z2tTanF1?=
 =?utf-8?B?V1lYb1NMTGxwYU9rZk8wakNTcHkzM3V2Qml2UytBamp1aWdJV1dLZ095eG8y?=
 =?utf-8?B?YzhGRDZNR1gwaXpKM2tmOG5jdEUwUi9VNDdsTjZoZnRNWkJobUc4aUdEN2Mx?=
 =?utf-8?B?Y0lsbjF0S3hXakdLNWZOMURFeTI2cXhIWmRuc0FuYlZUQU9HR2JVa0hXbFN5?=
 =?utf-8?B?WDgzZDNiNjBTTi9PZDhkc1pBTElSNnZ4Uk1zWnBLcG9NdFdXOVBMVmlKQ2dS?=
 =?utf-8?B?TEdkQ29xVTNoM0NyZStaazVQeFFJM0ZXWUVmUFBxSlNnQ2RUd0JYaGhYMGZJ?=
 =?utf-8?B?K3ZQTG95QWExSkNVT2M2VHVwV3ZTSDNiK1BtQTFHWGpvS082aXNFTkQwSUtv?=
 =?utf-8?B?WVpNUFlPNTFEeDVOQ09OUzBVVjJEbUhjMVIraEtqRTlFTnRUeW11Wkl5ZjBN?=
 =?utf-8?B?TllScGhxRXFwZ2dhbTNaOTUzZFV1NThDTGJDUUNlSTdiRnFINXBiL2tJa2xW?=
 =?utf-8?B?R2IzZ05SdU1kNTJEeWFCdVU2ZTI5UGo0aFRZQVpVWDNmNXMrNTZOZFN5MkdF?=
 =?utf-8?Q?c0RmUrIz/Wt+U3iXpjueWZnGdoqgpX+aK5PlO2n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d40efb7b-088d-480f-4a7f-08d8c9ef3b83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:01:00.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9t/4lZ7mx8sYuLJuvqF4SynOjO74D5YuJs4RS2QuDEKee3x1Bzah1OZdlHRPPsBUBkCJ56c1ij8qy69JSWblOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 01:42:35PM +0100, Jan Beulich wrote:
> Setting the timer a second (EPOCH) into the future at a random point
> during boot (prior to bringing up APs and prior to launching Dom0) does
> not yield predictable results: The timer may expire while we're still
> bringing up APs (too early) or when Dom0 already boots (too late).
> Instead invoke the timer handler function explicitly at a predictable
> point in time, once we've established the rendezvous function to use
> (and hence also once all APs are online). This will, through the raising
> and handling of TIMER_SOFTIRQ, then also have the effect of arming the
> timer.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

