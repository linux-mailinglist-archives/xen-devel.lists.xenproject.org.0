Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081416CC1B0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515883.799193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9wf-0005UG-RC; Tue, 28 Mar 2023 14:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515883.799193; Tue, 28 Mar 2023 14:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9wf-0005RT-NR; Tue, 28 Mar 2023 14:05:05 +0000
Received: by outflank-mailman (input) for mailman id 515883;
 Tue, 28 Mar 2023 14:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K3v=7U=citrix.com=prvs=4442f050c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ph9wd-0005R7-Ku
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:05:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c080cb-cd71-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 16:05:00 +0200 (CEST)
Received: from mail-bn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Mar 2023 10:04:56 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS0PR03MB7277.namprd03.prod.outlook.com (2603:10b6:8:12d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 14:04:53 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Tue, 28 Mar 2023
 14:04:53 +0000
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
X-Inumbo-ID: 85c080cb-cd71-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680012300;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bJry89oDabJavmGUMl3oDDvY5ATfXIcoAeYJZbEJpYM=;
  b=D+IuMrYULWtgmtARWXpEKov0w01HBcPSmFzqZnA81IEgBHJqpPXEPonB
   oJzGBpASDsVhlIANKhv+Kym6B9vzfLGllPN6MblqslGberdh/QQ7ofE1r
   LE0QPFNOy6fKDVip87mc68liTN2uGP1uoKxReEXXww9NRSasNK3W4n1bB
   A=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 103271235
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XGu+qK2beNom0mNXM/bD5Qdwkn2cJEfYwER7XKvMYLTBsI5bp2cCx
 jYaDzyBOf6NYDGgeYgiOt+yph5UvMeEztIxSgA4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJ05rs
 s0aGAs0TRGTqc262qOmcutmv5F2RCXrFNt3VnBI6xj8Vaxja7aaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqui6PkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03bWQxHmgBer+EpWn2Mx2nQyY+lc8Ukc/CnWGrOOykU6HDoc3x
 0s8v3BGQbIJ3EmiVNz0RRC7iH+CoB8HWtBUHvE66QeC0a7d6UCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaISEIKUcSaClCShEKi/HhqowuihPETv54DbW4yNbyHFnY3
 DSivCU4wbIJgqY2O76T+FnGh3emoMHPRwttvAHPBDr5sEV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHQvHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:YtjkaqwdCRb22xIAqedgKrPw671zdoMgy1knxilNoRw8SL3/qy
 nOppQmPHrP4wr5N0tApTntAtjkfZq+z+8N3WByB8bbYOCOggLBQ+9fBOPZskbd8kbFh4pgPM
 lbAs9DIey1IGJWyeDdy2CDf+rIxuPszImYwd3z9TNGayZES49d1C9FKiC9VndbeWB9dPkEPa
 vZ6cpDqyChangMB/7XOlAOQ/LfodnGj7LKCCR2ZSIa1A==
X-IronPort-AV: E=Sophos;i="5.98,297,1673931600"; 
   d="scan'208";a="103271235"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jx+8C9bmaeVZmYl2h36vgYmgZbB67NLwMO5HLmCLX2AnqzBnGckZVSvAgv9ikHRaDrf+RBKESZPUk/LKGAXm9ZPUJplny+bl73A9EgtgVTwAvG2hIJKMJtcKcCIATZv3Eq7PCbM28fgoxPw8VGDPmO5Mc7H1JyEygJouWUolneR0PPswIWxG3WO5UWx4VdXAUAcvL3Pk9BmkRnG8lK9gJWlwKWBl7n3gJ/zUP+h2EwavoC25AA7SEBMBBVkapwA9tYemMQfz2ASmzryz3sWGezq9qymExKCYblN1l0A9eoJwuxaOD0OBUZWh3VrJ1VuYYI6SBexn5/QdQmA3/kgFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1DS4VMMSiXKeCgZOSVNu18fpWQO9NZk3/qNtckSkE8=;
 b=ju6WnzS5tX9HtnplThGCCrM9xPAeL/RcBveFOxYacqpexH0sS6qFxBRVkMDc0p1CiL8FvLqb4MckXYKOGS1bxuxLmVUDTtb5FF8tqbbYc7cCqWDs84BPpsrdgGZRnyaRn7EzAsRpiaQ/Bee94uPSVkFMyuwztbg1PIz68GDfF/+JD0b6oJRvkqxadHvBhFIkvRwm4rcebb0yMhSUkjkdtKyDNa4iaMe485Lzv+vgPBxwandnc3h85bq641zjOmu9JJCsULcDmSimHYhmDQChck8aU8zrE1J1GzTJdkfoad1Jwq1YdVTqlg1nCdxc+NN8SaTcKDQrKrN5nj+9rkJ0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1DS4VMMSiXKeCgZOSVNu18fpWQO9NZk3/qNtckSkE8=;
 b=UPO1OHcfrEP5S6ionrJDlcou+q3/jAcxxjrfputwLH1MS6KNCe1j+//K9SMv+0FFoeseeHcoCpfL5+uZpsjOI1xkhXAnDPIHBil0qHsX5DACjgbuGsqNjG1uICZkrIizuG+rDEeQItCFoFtLRn3A9LPqm9LyA6OpcMK7gdB+AGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Mar 2023 16:04:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Message-ID: <ZCLz/2QeoMVyOej8@Air-de-Roger>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS0PR03MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8694c6-6004-400c-98c8-08db2f9566e7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kCF7SdRYyB5JWuXJM++fCKgz80vzMbXaM7DWuthwQEKYSYiHPvp2HCAFJs4NqowVblSyBlLoHfUD89Ra17/Q8h0z7s3FhKtvWMXBqb++M606i0dyrUqfhOYR+YUfv9ALOzkVK4Oun0G7klrjIiPscPHrWCxM22j5hHub6SiIFk+0weiM62m4yDewuspl9niYiPD5YaegGY/bwR1yuAxyNKERHxVMtXXdsWhvwrBDOg17WcZR2+UscsRbRg2olueA0uBRnUJtLF7sSUNnIqPVQJBOVj6v6q/FANZwgyVWCEFJuYw7tdDGrjiU+dtq36+PZlq01wITF14cR8KGQYGQOGTMlM6iUEUqqpf6q473zZ9xX3Desz0/2lZI6Fg1EuaiXAuJmojKvbafRX/OHQxmMb85zxyQ8sjM/yYEcMNjWMJW+6udwC387JPTqUyBcQmwiDVFo9ZVOUuS7mm47qk19bp5m1L8s4uyjokWfr5M1WC9EJP+fe/jK8aaViGZ4nsqrmoVYWmfyHHPmpuVZnGMwcXyqpBzll18dr8yiEbc41B32n9sEoAlTFBtvMqxvmsBlQLAQZ6pCttWuB1KlChF5TA4xcPI9XB76TtEhT6lWCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(6486002)(4326008)(66476007)(6916009)(8676002)(66946007)(66556008)(82960400001)(41300700001)(85182001)(2906002)(33716001)(86362001)(30864003)(5660300002)(8936002)(38100700002)(478600001)(316002)(54906003)(6506007)(6512007)(26005)(9686003)(186003)(6666004)(83380400001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3kxOVJtUTlvN0xGMnZSNU1yTXJUVC9EcDlWYUJrdXRsR1ozcS85SmFoL0tL?=
 =?utf-8?B?SVBHSW5ET2FMM0Q1aXZwZStJdlpScVNqYTl0cDNoU3dXbElMNkhSbklsYzdt?=
 =?utf-8?B?V2dMdkN6K3ZvSFJNdUdLVFZwRkJ6U3EwdVpzcSswejBkaUVLc0RmbzJWZVBG?=
 =?utf-8?B?RWVJLzc3S3VuakJITkRlQ3F4TUNrL3M5WGRXSUtQNGYycVlOVE1BVkVhVmo0?=
 =?utf-8?B?RnY4a0NTcy9WdkpyVnVFTGJZWEJ4SXM3V0I1QnpqRkdoQUhma1ZJNGxwbTl1?=
 =?utf-8?B?NUdDR200LytwYXdpT1hxb0x6ZTByUkpvZmlZWmxiNm5yM3RIWFdsRnQ3L1Ar?=
 =?utf-8?B?S2I1dzN1NERSZ1RVaXN0Q0pkckwvLzZ3RUtDQXZZMmUvMnROdDJCWTBrYyt1?=
 =?utf-8?B?ZHdEbm42OFNoa3ZGM094Z1UxSTlmNXd2MlFIQ09uS0JLY3poK1hCQVB2WHVN?=
 =?utf-8?B?WCtkLzNEZ1kwZEpDR2dXSnIzSnVoN2JPamxTWGVxb1I0ZWxUdUs2dnZIN3dW?=
 =?utf-8?B?SFJ0bFlLbDlLTlJ3b292MnZXNmIrVFM5WlozT1QwbS9rTldjWEY0TW1QWkl4?=
 =?utf-8?B?M2I2N1BDcWpFb1RkRHowTmdBRFRacXluMnlHWU90OUpHM20wQWwrMFY5TDc1?=
 =?utf-8?B?amFwL3FMUkc2dy95WnRNeERQS1VUWWhzcWY5Wkx0WmxKQ0JlRVYzaVdmWXdB?=
 =?utf-8?B?eHlwT2VqMUw1dXVSazh3TjBNbUNhVnVjZXJJdFVJWkg4L1hJT2YzWUZHa0ZD?=
 =?utf-8?B?L1ZBaGF3S0QrQ1RZdmY0eXdBY2lZRjI0VEUwR0ViVFM4cGhyT0k0czJET0Rk?=
 =?utf-8?B?Q0IxdUdwbUpQcG1sdkJad2QxVWhtSGtReXpTWFg1SmY4TUZiVXBNT3pXWUhI?=
 =?utf-8?B?NU1DOG9WNGhtV0xReWZrSXY5aWJBVENZWVF0Y2drdUE2ODhwUXl6VFBxTkpz?=
 =?utf-8?B?MU5vaitUWCtpekxZWlJsYVVlVVJLWkZ4SjFoRDF5YnRyL2RJeXdqNWxzclVr?=
 =?utf-8?B?MWpNZFR6VC8rVlRxZ2RadFVmajcyMitjRnBnVWl4Y2lvK0J2eEYreVoxUmsy?=
 =?utf-8?B?NmE4TG5qSElDQnBITkVQbGZuK3FWem9tLzU3K0FvcHROYWZzMWZIaGFVV2pD?=
 =?utf-8?B?VjB3RXhCM3QxMWNYVDM0QjEydmEyeXJuOE9UdEtJTUpFeHlBRksvdHpPdGxR?=
 =?utf-8?B?ZkZ3dzB0ZUs0YVBMMnJFRDMrWUVGemRlUlMzbDZTb29jZWhVSWgzZlptQnhJ?=
 =?utf-8?B?R1Foc0c0N255U3R2YWt1MU5UbnF6NjNoZVRpODhOYUhqb0R5aVA2RzNKRytS?=
 =?utf-8?B?NjFIZTdNaTBlQkxFTm5FRGs2ZDRKRVltbVNQYkNPT3c1SFJ4dTRmM2dkUmRO?=
 =?utf-8?B?VFp0RExLZE9LLzVyWkdUSXYvZHlZdTVUaFZaRFNTZ21yMEQrZFNiOXFYdHQ4?=
 =?utf-8?B?TVFKNjNJQnVoc3lNNlJLM1o0Z3BqWCtNUWhCbDU3WVl3RkpCTkloUDFEYTNs?=
 =?utf-8?B?bFVpdmdzWHJJWUVBQTNqbmRydjZudi85V2FPaHdPSXRIYlJqWXppU21pTjAw?=
 =?utf-8?B?YUg5dlczYXROYjlOUTVvQnljR3NiNFkxM3g0eU5pcG05aFppeVBGUjJ1OU5V?=
 =?utf-8?B?aUZjK0M3M0xtNktrZTZiRVZrMHl4dm5kTWt2dXRoMkRVcktEOXJVZStSaVpD?=
 =?utf-8?B?MnJUUjFZdzNodG1TbHNYUWVrdllyOVNxRVdnZHQ4ZGNaN2VSNWZYTEFZK2Q3?=
 =?utf-8?B?bEU4VWE5STh4RFpSVnNrdUttaVJvMForcVJzZmRtSTJ5UXhuUVBQdzB3M3BC?=
 =?utf-8?B?bXZ3dFowWlRGZWYwSHN5RncrbG0vWmxSQUZUQ0REakk4T1Evb1MwMGZ0NDFw?=
 =?utf-8?B?dkpvSGJGSEpoNzBPb09hQko1R0hsNUoybXBuc0JOWllWRFNlRkZHc1ozVlgx?=
 =?utf-8?B?U0JDY2pHdkVRRllOUVlwSXZVb1BOelZ5QmpkdGxaV3NwNWg4QWFsMGZlSFlJ?=
 =?utf-8?B?UERiU0oyMFhqcGdJbTFpdXVMRGtiM1pXSVZEemdYSXlIaUdFUHFDMzRMeGJ2?=
 =?utf-8?B?Z0JBTVRtTXZvRndlUjBGeWFtbEhobXIzeHl2Vmp1VkwxU0N3RkFucGpsSHVG?=
 =?utf-8?Q?DEhK7YFKTV8CBhTNk39ClUsuv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QTm/gSdwF0aWwyhWJm196Fj9nfSPn7YEnWptWBa36+lY0AG8JGcmjMvFqfg+9nUv9nqZSvcjh/x5lDtIB02X1lhzyAOnjy9iwPOX5LwrYERCo/USDVaDz6oA+7mrrT94n92JMPKl1QfZHHWO3F06cAqIKzkyVXWHrFaujVLiRLloK5/6fCBB3rcfFZ7KSrTAeE6ribpXb0v34GrVJ3MzFlG8kU2rCEqgCkvTauxKI9bBHfOA2iAUsUX9EXuw/pOUbcnjEEiDQX/mHny3YYJf26Ji6nTIiuu599ZfVCZda1O+8xXwQJnfhZV99uNRC/gJS+o0f8cYevZsxZeKwn8cOuBMiaxcId5dW2xloJRHrlseA9+NmdrkU6dlYkcF4LQPVFZqnReLI9iqMCTAP8fqZes+V3EUc7CeJHQBEIS8TEcCDlJJOOJsHT7YCXnRcnvOKTctjNfeDc6wDYFU0KiTz44zV+MZNiSc5HDyphv5i91XImRtloYLQpWlz9I2XgbP9RDN8BM+1v1XkMov+VKx0taynixekzwhrK+oYVfmg4vI0bIjVATlamUcRP5FA72CfffWnAXcop03Hwg46xL3VTtwqbJbOq7g6Me/JaKwNFTYRDaTQwL4CLYCVW4zFMbKX3omolGzFOEcxR0oYxPU6mMsI+hNrPS+QQ02bs3XqgdrgjstQ+t31lTS8+mnof/TJqWtnWuvKxs6vLllxhSUyo9DdfFlZSFp5C4nmCbQTf3ETKUS8aJp7jgXsFIFIXYEdEoggEWoawmJatvhhUOgKctXJHkKNAubVJGqgpAuX8TizNTEq+Xb2DUNxSTLfZ9fc6OYdMpnrTyXsi1vVrSXCa/VrRFlJzJ1DEDvYa7039RYIKV7k5AGXYjX9vRHoWxf
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8694c6-6004-400c-98c8-08db2f9566e7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:04:52.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zENpdd8slm1BHugYQA47fHweNuMGOSPtMenInaCxDRKo9lMYE7crHcGTSr0Ru9fhQ8ernQBsUTPe3+q6jleVBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7277

On Mon, Mar 27, 2023 at 12:09:15PM +0200, Marek Marczykowski-Górecki wrote:
> In some cases, only few registers on a page needs to be write-protected.
> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> PBA table (which doesn't need to span the whole table either).
> Current API allows only marking whole pages pages read-only, which
> sometimes may cover other registers that guest may need to write into.
> 
> Currently, when a guest tries to write to an MMIO page on the
> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> from userspace (like, /dev/mem), it will try to fixup by updating page
> tables (that Xen again will force to read-only) and will hit that #PF
> again (looping endlessly). Both behaviors are undesirable if guest could
> actually be allowed the write.
> 
> Introduce an API that allows marking part of a page read-only. Since
> sub-page permissions are not a thing in page tables, do this via
> emulation (or simply page fault handler for PV) that handles writes that
> are supposed to be allowed. Those writes require the page to be mapped
> to Xen, so subpage_mmio_ro_add() function takes fixmap index of the
> page. The page needs to be added to mmio_ro_ranges, first anyway.
> Sub-page ranges are stored using rangeset for each added page, and those
> pages are stored on a plain list (as there isn't supposed to be many
> pages needing this precise r/o control).

Since mmio_ro_ranges is x86 only, it is possible to mutate
it to track address ranges instead of page frames.  The current type
is unsigned long, so that should be fine, and would avoid having to
create a per-page rangeset to just track offsets.

> The mechanism this API is plugged in is slightly different for PV and
> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> it's already called for #PF on read-only MMIO page. For HVM however, EPT
> violation on p2m_mmio_direct page results in a direct domain_crash().
> To reach mmio_ro_emulated_write(), change how write violations for
> p2m_mmio_direct are handled - specifically, treat them similar to
> p2m_ioreq_server. This makes relevant ioreq handler being called,
> that finally end up calling mmio_ro_emulated_write().
> Both of those paths need an MFN to which guest tried to write (to check
> which part of the page is supposed to be read-only, and where
> the page is mapped for writes). This information currently isn't
> available directly in mmio_ro_emulated_write(), but in both cases it is
> already resolved somewhere higher in the call tree. Pass it down to
> mmio_ro_emulated_write() via new mmio_ro_emulate_ctxt.mfn field.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Shadow mode is not tested, but I don't expect it to work differently than
> HAP in areas related to this patch.
> The used locking should make it safe to use similar to mmio_ro_ranges,
> but frankly the only use (introduced in the next patch) could go without
> locking at all, as subpage_mmio_ro_add() is called only before any
> domain is constructed and subpage_mmio_ro_remove() is never called.
> ---
>  xen/arch/x86/hvm/emulate.c      |   2 +-
>  xen/arch/x86/hvm/hvm.c          |   3 +-
>  xen/arch/x86/include/asm/mm.h   |  22 ++++-
>  xen/arch/x86/mm.c               | 181 +++++++++++++++++++++++++++++++++-
>  xen/arch/x86/pv/ro-page-fault.c |   1 +-
>  5 files changed, 207 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index 95364deb1996..311102724dea 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2733,7 +2733,7 @@ int hvm_emulate_one_mmio(unsigned long mfn, unsigned long gla)
>          .write      = mmio_ro_emulated_write,
>          .validate   = hvmemul_validate,
>      };
> -    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla };
> +    struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = gla, .mfn = _mfn(mfn) };
>      struct hvm_emulate_ctxt ctxt;
>      const struct x86_emulate_ops *ops;
>      unsigned int seg, bdf;
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index d326fa1c0136..f1c928e3e4ee 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1942,7 +1942,8 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>       */
>      if ( (p2mt == p2m_mmio_dm) ||
>           (npfec.write_access &&
> -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
> +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
> +           p2mt == p2m_mmio_direct)) )
>      {
>          if ( !handle_mmio_with_translation(gla, gpa >> PAGE_SHIFT, npfec) )
>              hvm_inject_hw_exception(TRAP_gp_fault, 0);
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index db29e3e2059f..91937d556bac 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -522,9 +522,31 @@ extern struct rangeset *mmio_ro_ranges;
>  void memguard_guard_stack(void *p);
>  void memguard_unguard_stack(void *p);
>  
> +/*
> + * Add more precise r/o marking for a MMIO page. Bytes range specified here
> + * will still be R/O, but the rest of the page (nor marked as R/O via another
> + * call) will have writes passed through. The write passthrough requires
> + * providing fixmap entry by the caller.
> + * Since multiple callers can mark different areas of the same page, they might
> + * provide different fixmap entries (although that's very unlikely in
> + * practice). Only the one provided by the first caller will be used. Return value
> + * indicates whether this fixmap entry will be used, or a different one
> + * provided earlier (in which case the caller might decide to release it).

Why not use ioremap() to map the page instead of requiring a fixmap
entry?

> + *
> + * Return values:
> + *  - negative: error
> + *  - 0: success, fixmap entry is claimed
> + *  - 1: success, fixmap entry set earlier will be used
> + */
> +int subpage_mmio_ro_add(mfn_t mfn, unsigned long offset_s,
> +                        unsigned long offset_e, int fixmap_idx);
> +int subpage_mmio_ro_remove(mfn_t mfn, unsigned long offset_s,
> +                           unsigned long offset_e);
> +
>  struct mmio_ro_emulate_ctxt {
>          unsigned long cr2;
>          unsigned int seg, bdf;
> +        mfn_t mfn;
>  };
>  
>  int cf_check mmio_ro_emulated_write(
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 0fe14faa5fa7..b50bdee40b6b 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -165,6 +165,19 @@ bool __read_mostly machine_to_phys_mapping_valid;
>  
>  struct rangeset *__read_mostly mmio_ro_ranges;
>  
> +/* Handling sub-page read-only MMIO regions */
> +struct subpage_ro_range {
> +    struct list_head list;
> +    mfn_t mfn;
> +    int fixmap_idx;
> +    struct rangeset *ro_bytes;
> +    struct rcu_head rcu;
> +};
> +
> +static LIST_HEAD(subpage_ro_ranges);
> +static DEFINE_RCU_READ_LOCK(subpage_ro_rcu);
> +static DEFINE_SPINLOCK(subpage_ro_lock);
> +
>  static uint32_t base_disallow_mask;
>  /* Global bit is allowed to be set on L1 PTEs. Intended for user mappings. */
>  #define L1_DISALLOW_MASK ((base_disallow_mask | _PAGE_GNTTAB) & ~_PAGE_GLOBAL)
> @@ -4893,6 +4906,172 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return 0;
>  }
>  
> +int subpage_mmio_ro_add(
> +    mfn_t mfn,
> +    unsigned long offset_s,
> +    unsigned long offset_e,

Since those are page offset, you can likely use unsigned int rather
than long?

I also wonder why not use [paddr_t start, paddr_t end] (or start and
size) and drop the mfn parameter?  You can certainly get the mfn from
the full address, and it seems more natural that having the caller
pass an mfn and two offsets.

> +    int fixmap_idx)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    int rc;
> +
> +    ASSERT(rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)));
> +    ASSERT(offset_s < PAGE_SIZE);
> +    ASSERT(offset_e < PAGE_SIZE);
> +
> +    spin_lock(&subpage_ro_lock);
> +
> +    list_for_each_entry( iter, &subpage_ro_ranges, list )
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +    {
> +        /* iter==NULL marks it was a newly allocated entry */
> +        iter = NULL;
> +        entry = xmalloc(struct subpage_ro_range);
> +        rc = -ENOMEM;
> +        if ( !entry )
> +            goto err_unlock;
> +        entry->mfn = mfn;
> +        entry->fixmap_idx = fixmap_idx;
> +        entry->ro_bytes = rangeset_new(NULL, "subpage r/o mmio",
> +                                       RANGESETF_prettyprint_hex);
> +        rc = -ENOMEM;

rc will already be -ENOMEM, albeit doing error handling this way is
tricky...

> +        if ( !entry->ro_bytes )
> +            goto err_unlock;
> +    }
> +
> +    rc = rangeset_add_range(entry->ro_bytes, offset_s, offset_e);
> +    if ( rc < 0 )
> +        goto err_unlock;
> +
> +    if ( !iter )
> +        list_add_rcu(&entry->list, &subpage_ro_ranges);
> +
> +    spin_unlock(&subpage_ro_lock);
> +
> +    if ( !iter || entry->fixmap_idx == fixmap_idx )
> +        return 0;
> +    else
> +        return 1;
> +
> +err_unlock:
> +    spin_unlock(&subpage_ro_lock);
> +    if ( !iter )
> +    {
> +        if ( entry )
> +        {
> +            if ( entry->ro_bytes )
> +                rangeset_destroy(entry->ro_bytes);
> +            xfree(entry);
> +        }
> +    }
> +    return rc;
> +}
> +
> +static void subpage_mmio_ro_free(struct rcu_head *rcu)
> +{
> +    struct subpage_ro_range *entry = container_of(rcu, struct subpage_ro_range, rcu);
> +
> +    rangeset_destroy(entry->ro_bytes);
> +    xfree(entry);
> +}
> +
> +int subpage_mmio_ro_remove(
> +    mfn_t mfn,
> +    unsigned long offset_s,
> +    unsigned long offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    int rc;
> +
> +    ASSERT(offset_s < PAGE_SIZE);
> +    ASSERT(offset_e < PAGE_SIZE);
> +
> +    spin_lock(&subpage_ro_lock);
> +
> +    list_for_each_entry_rcu( iter, &subpage_ro_ranges, list )
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    rc = -ENOENT;
> +    if ( !entry )
> +        goto out_unlock;
> +
> +    rc = rangeset_remove_range(entry->ro_bytes, offset_s, offset_e);
> +    if ( rc < 0 )
> +        goto out_unlock;
> +
> +    rc = 0;

You can use `if ( rc ) goto out_unlock;` and that avoids having to
explicitly set rc to 0.

> +
> +    if ( !rangeset_is_empty(entry->ro_bytes) )
> +        goto out_unlock;
> +
> +    list_del_rcu(&entry->list);
> +    call_rcu(&entry->rcu, subpage_mmio_ro_free);
> +
> +out_unlock:
> +    spin_unlock(&subpage_ro_lock);
> +    return rc;
> +}
> +
> +static void subpage_mmio_write_emulate(
> +    mfn_t mfn,
> +    unsigned long offset,
> +    void *data,
> +    unsigned int len)
> +{
> +    struct subpage_ro_range *entry;

const.

> +    void __iomem *addr;

Do we care about the access being aligned?

> +
> +    rcu_read_lock(&subpage_ro_rcu);
> +
> +    list_for_each_entry_rcu( entry, &subpage_ro_ranges, list )
> +    {
> +        if ( mfn_eq(entry->mfn, mfn) )
> +        {

You need to take the spinlock at this point, since the contents of
entry->ro_bytes are not protected by the RCU.  The RCU only provides
safe iteration over the list, but not the content of the elements on
the list.

Thanks, Roger.

