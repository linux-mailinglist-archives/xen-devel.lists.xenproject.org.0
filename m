Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033456C646E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 11:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513722.795156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHqy-0007tB-Me; Thu, 23 Mar 2023 10:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513722.795156; Thu, 23 Mar 2023 10:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfHqy-0007rS-JU; Thu, 23 Mar 2023 10:07:28 +0000
Received: by outflank-mailman (input) for mailman id 513722;
 Thu, 23 Mar 2023 10:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIVP=7P=citrix.com=prvs=439b2ffc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfHqw-0007rK-C9
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 10:07:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e9c8b82-c962-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 11:07:21 +0100 (CET)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 06:07:00 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 10:06:58 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 10:06:58 +0000
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
X-Inumbo-ID: 7e9c8b82-c962-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679566041;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RGxIRGRf/Mp4WvZP2hqPaxWk6ay0l+fhbZmsiwunRZ4=;
  b=WfRfeEpJsxiQi0P03gh5MTDQx0gg1DRYE+5zQS9o12hdhW3DfeLpzQX7
   Le3I46d4psEk7cgf13otY/dn4XJvFFAng9s/YXu6MWyKA6qcvAUW8iQLM
   qnkHpXRBxVAa4ISxJnFxo0gFp6UT0Z4RjEesJwK4hUhfaU0+asWMOq/MB
   g=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 102410676
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MhaqeqMfR1r/x1fvrR23lsFynXyQoLVcMsEvi/4bfWQNrUohhTJRy
 GYXD2CEP/+MazD9KYtyYIu3oRlU7Z7QnIdkSwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t1eKlhis
 voSFGxXKQqZu9qv5LzjZtA506zPLOGzVG8ekldJ6GmDSNwAGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PNxvzC7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqijw37eRwn2TtIQ6L+Oy1OVzhgCvwUssCj5HU2m6oPS+hRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhRqubyRDHibr7GdqGvoPTBPdTNaIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQEGbZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:zqnwmq6uE9R3KIXYlQPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102410676"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/2qvdtjq405hSmw8xX10y+XYB/pRBrgUZW6cwak7HrxcpdKlVxUvZkOFQhEPhW0mO/HyMAvelKWX3/6wloicIJRNGID7cyJYuvnZFbj9ozVOkO+uFzHfua8AeU8HmUqpnYYu3eVqd/gEm9gteJjLcYPGtS+HYvOd/BMf0ndzeY4jIzjDi0jSqR7HAoDP7erCbhUI/1jw+LDDTycqmFKtlCvWidtnaV068C+1KHzZMfEw3cm9grJnK3IijLcTMzgwZiFiIu7tODKEkCz+sRkx8Y1s7T0LHoDN76baVvBlOtaKOz0Nz2Pg0jbWBgI4cLmRGRcfLvgWEElsoiUZHeqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAKYC68n1DiZSxSGHewFC0uhZ+ZAscd6UiVzbODC32E=;
 b=mRkbfp0QKrNHIuBJkWRi6Q4lQAX/C29DNveDpixR0XdtiULF8exOP0BjbZfb3jqxOFmGTY4a+jZFOyo5tpCEse07hMzlc8K5pJa2t33LboerGXJYU8f1usHdZvDeQKExGwsuSJDU/qBNH0UO8WAOd/hy95NhFNU2ApjFsKhHPy/M6b69BEcjJ/1SfM1yAc6S6G22ACYl2IIHf89SiRNZiO4UuLFvtw/B3NzRYb8xPd76P320I1xXgwwxAjDMejiwUfIzOPDVArx3gtaXHzzeHPTEw8h8+AdKb3OkFywkXyGQhBLsBx1Guq0DCkqASv0dX7Hs5DdC75QmGKel09l6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAKYC68n1DiZSxSGHewFC0uhZ+ZAscd6UiVzbODC32E=;
 b=X4eXIFxCIdMDm3tBJ5iRKzbo1C/Y3w+dwh2oKbaL42R+SH8fGOzg4PDWQsk+jcXSqKBlv7kr1y6g0TdjiNKDkQgfrCWfvRZNRnep17+j4/ic1DoJf9gEx87xHJIgun15BLi9oQzgnfpov+1LWluvookDqe2baVqy61muxEA0+Ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Mar 2023 11:06:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBwku+X6dgqFqdeJ@Air-de-Roger>
References: <20230322143001.66335-1-roger.pau@citrix.com>
 <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
 <ZBs1c7ILtkRQOzki@Air-de-Roger>
 <ZBs2BKAfoRap1CjC@Air-de-Roger>
 <d526b87a-374a-8d78-f66f-cf71537790af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d526b87a-374a-8d78-f66f-cf71537790af@suse.com>
X-ClientProxiedBy: LO4P123CA0631.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: ef83328e-2ce6-4af8-69e2-08db2b86567c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2hsdUVqmnwfD4lF7aHWAuyW7dqwvRPXAnUtmEj4AZ/hurbatTWVUnzscXKtOGkG6QoJaYgrMkqlXboleTrUtjkJaeYpk2EcR82ltTZDvi4ez7pIvaBNYF/0U++Re7CqHnHyrXrchmvoSLBPxDWSQZznwPE2kwRoAaCdehWejhi52xk+GwO975o5vnW/0QnC3y8effqgiiInfy2WvW3N6pnoPgjzsLlaG/D3YyyLyCPuuZqufjIPbXpOPH0jwNdBV+LTLabvZgrwRqveFOpU836p/YvooWhp9NguxzKxBRcqOkeu2yg8EatxYdeDG6zfV20WxayMLVl80WNju53501CR4O2bHu9SCpCO1+iAGlK7KRGpTqMcWhIlThQCMhX6pwpXexb6K0hbH0R9VDLrCSwSnG+X7ZBziBIVXRGLEQngcFRO88GJUGWAA/gK340I1iyhkKkbXCfh0CB886zc6t5iI0UNfLQxMUEMFLx+J7cBgtR7yTCeLp3EkHp3qZbn7/gSvODIQx5ibY08wz93oukkcHXhBPjZN1TMmeXXP/ZRgTwfokaGehHF32DvzIS0Fiw798BpYSZFpFInP+QEcGdkEGVr7+k+zLNfKVz0jPiX38NeVlfvl0iOo6q0eHEo5FbzigVZ38SmXLlsxl9JDuFIuNfsydngzUy6qJ0CDDBECVYDaOhZ4nVIWTveVbanD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199018)(5660300002)(66556008)(8936002)(66946007)(6486002)(316002)(2906002)(8676002)(41300700001)(6916009)(4326008)(478600001)(66476007)(6506007)(6666004)(53546011)(9686003)(26005)(6512007)(186003)(83380400001)(82960400001)(33716001)(86362001)(85182001)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5nSXo3OHdWSHBJbTN0Y2xLMVZsdFRlenRZcDZKTE1jTHdPcVFHRWg2TXI3?=
 =?utf-8?B?SXlVMHJOVTZkcnN3M0EwMHE4Y1RLdFc5V1Q2a091VlJMQXdSMjZHZ0ZnRmdU?=
 =?utf-8?B?UUpTNlo5TFBvUi9JMUdwLzlYMk5mNUhvRzdOb0oxQjlVOGdPOHRraGcwRU5Q?=
 =?utf-8?B?MEhIcllFMVQ3Q2hLOW5rZFdPVjltMzVsME9zK3cxcjh6ZmxXcUZlQnBKOEx6?=
 =?utf-8?B?Qll0QXJ2cnZ5TUpZeWkxNzlyWkUzaVJ5T2FCYVpJemVUZXBSSUhnZFVYU2RZ?=
 =?utf-8?B?ejdUTWtpenkwUVFhUWdUSHY0OHZCU3hoUitTN1hjcDdWVHloL2pQd2xiYm5E?=
 =?utf-8?B?S2RuMEJOQUMzeldFQVNvZlBOcXh6Ynpid3VxanZKMEE1QkZLc3BGTXZlS2pG?=
 =?utf-8?B?Q1FWL2wrTjBvS2N3RElmUHFmZ3lnckhKblR4bjRaY1YveG5kNVJFajZFN3hp?=
 =?utf-8?B?ZjhmTmU4MTFYVDdGUGltMm5qd2czbW5YOWRIcmhzVU1UdHBOazNoeDdiR2My?=
 =?utf-8?B?YXY4QkZTRTVDczJVajJNWnJobVowbWlFSmJDR2kvaGZrSU41WngyRUdvajVv?=
 =?utf-8?B?ZGM1UWk3dENuZUtycHZiS0tweDZkY3RwZitYWHV4RkpCdGdjSGxXSWhENnJ5?=
 =?utf-8?B?amowV01odkVSMnFNNW8vS0s5MkZHR0xjemFVOE40VGJMb3EyUVNVdVdNY2pU?=
 =?utf-8?B?ckNnVWFyejRLd3QrWjdEVjBZYnJhN1R0d0k2cENuQzhOTjQ4aU5wcGZGMnZT?=
 =?utf-8?B?Yjl5YnBETzdmbyszNlRZSFlzMU5xZkJFTlpaYnJUZ1A2RlAyUFBudEVpZ3Zt?=
 =?utf-8?B?emJoYW0zbXZoOUJINFdWY01kbGJTOTRSVEZtUE1qS1hXWDFIK1B0SXBOMVpu?=
 =?utf-8?B?ZjZWcnphbWFzVlc2K08zVDcxdkJYYzV3aml0MTlqY2VHK0pqQXR1Z1BNU05h?=
 =?utf-8?B?QXpFSFFKL3dwTjcrTlNPOHBCZ3czNHhNdkhsNnh6Zzl1Mk85ZGpqRWx3QUR5?=
 =?utf-8?B?K2lvdmhWUWE5UjJuK0JJTWRCZTZGY1pFYTdldEdlTnJYREgxVVU5eTJJVjlz?=
 =?utf-8?B?SmFaZGc3WjdqZjRnMW9qYWYwREswR2QvY2xsUzIyVHpEV3NRYy8wMFdIOTlM?=
 =?utf-8?B?U0RCc1Buby9sb1ZNQUNyeHhQbnpUYmZiZWs4OVZFRzQrcnVxbVl1WmVrTmpN?=
 =?utf-8?B?R1FDVDNzQzhzOTVkRWlZbHFXRit2QWhvcHp3Q3hna0ExR09QWmV6SHhrOFlC?=
 =?utf-8?B?V090YjNnZHB6WEpPSGxCUkZwSjNaS3Q2VU5jajVMbmxLcU5KRVhmeFZaeFhy?=
 =?utf-8?B?N2RTVW9nNGNySmlCVTExbjI1Q3c0aEhNajZORlhBYWlDNFdRV2t0T1Y5SHp1?=
 =?utf-8?B?T2tlUmdwUVkyNkNqYi90MkNIdHA5QTlzVlVWSldWMVl2Zm5BVEpySGRNQm40?=
 =?utf-8?B?M1crSzZGWHFlMEFZUSticTFmQ1B2TkNrMExOWGlUSXB3aFRYZTAvUzhza3dK?=
 =?utf-8?B?NEFEZDZIMjNWa0l2UXZWd0ZvM1paZ1UwSWxZVkdaWkFsRVNwODViRWY5RmM2?=
 =?utf-8?B?V2ZjZTZOWks4ekpQSkNYKzF6Nng0amZSd2hKV1NMUGVXTVVQM1F2em9HL0Y0?=
 =?utf-8?B?L3hkbEM1YjgzdElvUW5mZHY5YkxCclRLUmdxOUk4TXhzZmJGdU9aYW5PYlhI?=
 =?utf-8?B?eXBqRzQvN05ST0tJV25jMkRHc1YzaU9vTTR1NUh5THFrNWo1VlRuZnM2U0Fv?=
 =?utf-8?B?a29YRzU4MmtmdVkzbzBsMUtYT2JTaFBMbFVzMklSZ1dQZnErZmJMeUMxMDM3?=
 =?utf-8?B?V3h5dVZmSmwvMlYvdnZxTytyYU5xQk9KdWlXeXVxL29MRDk5QlZRc2tvSzlZ?=
 =?utf-8?B?eXBYcVc1R1VLUXJzSE5CK2tNYSs0UVpVODdtam9BV081b2ZBTEVIQ0VMb3VU?=
 =?utf-8?B?bzRnYndxVDZ6YVhXQXhYTTkrM3FibzBTNVBwbGJDczEzNEIxVFh2UEt1VC9t?=
 =?utf-8?B?Tm4rMkNrKzlhWUx5cWNjTEVLMWFIOVYyMDE0MnB4OHdpZ3ZxOFUyd2I2ZmZO?=
 =?utf-8?B?L3JxWlk4RVovUU1DbHA5NDlhZmxxVzhWZEh0REk3Qy9PMk9JWTBMWHdwZUVm?=
 =?utf-8?B?NFNxMVlPZkIyTE53U1hyL2V3Ly9KODJOa2NqNWd2NEJqcVlOMUgzZ2hJMzFi?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L20W7VL2rivQQPoTAMnq3BZvByJHbvsOZQkTISPd3/K1TpRgAim/jg47ke6inKt4haNNVSZheG9r45CEhli1YWayL/IhvY3MFa5GH82C0A53DMbB4fDbc0LhdEIoQf6tRk6LVDSPM9j0EHFz+EsuFKym9WzJYa9KS6zV+paNMD5yiLdbYtabVMAEpANxmr+XOYSf88sHG4fj528LfKgSz9+pAq0IpnNfMo8xeiqL8Ixv7NfcQCK4wBOngxHC2STRxKQqabDIH3uO5NyGkjxV7wFkN7Qhv9UqbKPDJTuRIOMF+ySTniUJdvzzxu9raJ04xIcifhiFUfUxLAmtNbHH5nbThmyQVHt7whiwLpk20axD2U0HWWMTem06bgp29gf2tYSZr85kd3EmxnRWbqHm9QA4ldaqd17t8k162oQnHyBPhO+fWd18XwOa81kjYfQlWIPaRc7lTv3HRJP7OWuaByBmVpyUDdjoj094pF3oXv2bb03sB737uzEo8rUeAfdhfjOT0QWJemydw2BH0gX2vomcBPufXKRs+yyhcs7QHHYKoUUlDBpG2XQp3SMss4MOnIZ3VtNowX7MskEG2RdimN9i9YuQ0F8eJyu/E5KJq75LPqR7TVBvi/dxqbP1OHEg2+HZ3V326X65/R0E2bhKFQhDrozC2x2F7ysxvnVnh7+JMhzg5Ipk/ntnOGCGp6oPCxUzhTKqUaU43lbdXPNAkcaNycjgdvIbeQmXXm/b+huScAg3ohUBBp1E6ICAy7lSWH5Bu4DLGKz8rRsA/TERLtuyIlgMqs9Rip1JiHIMb1sksdUVldnflUDIJMlGhjPi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef83328e-2ce6-4af8-69e2-08db2b86567c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 10:06:58.2588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bFbBHR7+oeDdbeVdHP2vmJdXCTu1jB0AXwDjL4RISZEhz1IHja77xUvvUc9PWauWpeNOOg8UgqVwK/av5M1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561

On Thu, Mar 23, 2023 at 09:02:31AM +0100, Jan Beulich wrote:
> On 22.03.2023 18:08, Roger Pau Monné wrote:
> > On Wed, Mar 22, 2023 at 06:05:55PM +0100, Roger Pau Monné wrote:
> >> On Wed, Mar 22, 2023 at 04:14:54PM +0100, Jan Beulich wrote:
> >>> On 22.03.2023 15:30, Roger Pau Monne wrote:
> >>>> Changes since v2:
> >>>>  - Slightly adjust VMSIX_ADDR_SAME_PAGE().
> >>>>  - Use IS_ALIGNED and unlikely for the non-aligned access checking.
> >>>>  - Move the check for the page mapped before the aligned one.
> >>>>  - Remove cast of data to uint8_t and instead use a mask in order to
> >>>>    avoid undefined behaviour when shifting.
> >>>>  - Remove Xen maps of the MSIX related regions when memory decoding
> >>>>    for the device is enabled by dom0, in order to purge stale maps.
> >>>
> >>> I'm glad you thought of this. The new code has issues, though:
> >>>
> >>>> @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >>>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >>>>  }
> >>>>  
> >>>> -static void __iomem *get_pba(struct vpci *vpci)
> >>>> +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
> >>>>  {
> >>>>      struct vpci_msix *msix = vpci->msix;
> >>>>      /*
> >>>> -     * PBA will only be unmapped when the device is deassigned, so access it
> >>>> -     * without holding the vpci lock.
> >>>> +     * Regions will only be unmapped when the device is deassigned, so access
> >>>> +     * them without holding the vpci lock.
> >>>
> >>> The first part of the sentence is now stale, and the second part is in
> >>> conflict ...
> >>>
> >>>> @@ -482,6 +641,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>>>          }
> >>>>      }
> >>>>  
> >>>> +    if ( is_hardware_domain(d) )
> >>>> +    {
> >>>> +        unsigned int i;
> >>>> +
> >>>> +        /*
> >>>> +         * For the hardware domain only remove any hypervisor mappings of the
> >>>> +         * MSIX or PBA related areas, as dom0 is capable of moving the position
> >>>> +         * of the BARs in the host address space.
> >>>> +         *
> >>>> +         * We rely on being called with the vPCI lock held in order to not race
> >>>> +         * with get_table().
> >>>
> >>> ... with what you say (and utilize) here. Furthermore this comment also wants
> >>> clarifying that apply_map() -> modify_decoding() not (afaics) holding the lock
> >>> when calling here is not a problem, as no mapping can exist yet that may need
> >>> tearing down. (I first wondered whether you wouldn't want to assert that the
> >>> lock is being held. You actually could, but only after finding a non-NULL
> >>> table entry.)
> >>
> >> Oh, yes, sorry, I should update those comments.  vpci_make_msix_hole()
> >> gets called before bars[].enabled gets set, so there should be no
> >> users of the mappings at that time because we don't handle accesses
> >> when the BAR is not mapped.
> >>
> >> Not sure whether we should consider an access from when the BAR was
> >> actually enabled by a different thread could still continue while on
> >> another thread the BAR has been disabled and enabled again (and thus
> >> the mapping removed).  It's a theoretical race, so I guess I will look
> >> into making sure we cannot hit it.
> > 
> > Hm, maybe it doesn't matter much because such kind of trace could only
> > be triggered by the hardware domain anyway, and it has plenty of other
> > ways to mess with Xen.
> 
> Preferably we should get things to use proper locking. If that turns out
> too hard, properly justified such an exception for Dom0 might be
> acceptable.

Right, one idea I have would be to use map_pages_to_xen() in
vpci_make_msix_hole() to remap any existing virtual addresses to point
to the new physical addresses, so that there's no unmap.  I think this
would be fine because map_pages_to_xen() does an atomic write of the
PTE, but not sure if it's abusing the interface.  Such remap would
avoid taking the vpci lock for the whole duration of the access.

Thanks, Roger.

