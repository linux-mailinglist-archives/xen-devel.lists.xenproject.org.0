Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4A68E92B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 08:41:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491595.760778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPf4e-0003PX-Qg; Wed, 08 Feb 2023 07:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491595.760778; Wed, 08 Feb 2023 07:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPf4e-0003N3-O1; Wed, 08 Feb 2023 07:41:00 +0000
Received: by outflank-mailman (input) for mailman id 491595;
 Wed, 08 Feb 2023 07:40:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPf4d-0003Mx-6S
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 07:40:59 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9b809d-a783-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 08:40:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8715.eurprd04.prod.outlook.com (2603:10a6:20b:43e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 07:40:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 07:40:55 +0000
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
X-Inumbo-ID: ec9b809d-a783-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbBL+otwZm0mm3IfwZp0KVwGoF5lyOSwgFrOoqvFZPqVFjLGrfERGMi/wC7GPa65w56qw48q/ZoB4EXZlduiMiDWI/EWNWzyDtYv5w/1WYqJQQNZKWMBpu71Ngj5Un8OYJBbacubgP1y0yVs+wVBXS+03i/Cb9tsVfyAAod+QuFAg597cIHMbbyiKMTSVkXsSNY83e0iDFbBen8Lb09p0IbPcmpba8ZFGoJXceodPyTQRc7ozxL8OKW3O5Qv0LBFcSerRFfbA/SorVEbg3hZqAXC5+tj9McHc2Gl2v41gArWLH0dqaft/VQAAA9yH4WYs4lHE0yqcK8IXDU7MuOuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMHdsj1dxM24biHuwFUsHVtaHLX5hyeS4TF1uR4NEk4=;
 b=k70qq6L1DL2BbmeNFNzGjzNuxnUJjMidDoQ6g7b95GZQ8aqIobfhSUZx0kM0PmXvihH9qjDnE7x+coaC7ZAWdGFjfrXmZdQWLP03BXxI4yOhxifUSBCybrIFzZ1Xhs4rXuZdmqHII1v7qee89yuUCGW34VtXrwElPM2t4lx8mWVrg76tTXSLYnORRI9ExBqDVjdEYAgJ6PhtavqM1kMxJezYyTh2TJkFbMmzPujXpWzayELYV7Vrzpz/q7JRAStuUjYXsdgAe7vLd3T31jbD4jNbLIQgglwdkQIlycr41aBo+LknMRLxttt+WSH3J2POg0Pi3xRMaVpeJTcRS5/3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMHdsj1dxM24biHuwFUsHVtaHLX5hyeS4TF1uR4NEk4=;
 b=eOrN6Hy8zQ3tQLO/QWKIDVZonVzjbAAKO1WafQVpJIgEiIdrFvmOOkczXKKu0KSbif6+X5TrkCNyoOUAC8+4h9VbObmn10YKYQm3turKCm+SfytJ5pjE76iiHcFvkVD3J5CuzYI/W5/dXOy3+CLu81tzQSTN0QrlQzaq5SZKG8/0ZLicC94PinuWCXGFV9Fv/4YKFnwDIezlWqjOh2WlVB/WWvlUs1P704XXzh9dcRY8w2RBMHhjlZV8VHbclZEaxDYci+6HRgbXBeE9dN8WesoRGIvfZ5Sk8wpMs7Q8FoIr+T2lGSmJvXY8NzgrKZfyypr8NCwvTu6m+T8Dw37BTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f3c358e-02b9-94e0-0b06-8a96ff92519b@suse.com>
Date: Wed, 8 Feb 2023 08:40:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1675829866.git.demi@invisiblethingslab.com>
 <32fae62c9eb9e9536d49fdd28e1bf54430842023.1675829867.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <32fae62c9eb9e9536d49fdd28e1bf54430842023.1675829867.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ea974d-671a-40b9-ee53-08db09a7cf8a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67kQRuswuycAYHUkfSTkijOswe7ub66r+lnJ8b4b/pxUNRxZIwXeAlVj2OXb+kZMfdVtv8DkzrWmCEPxTY3cjTYSU0Yrdv0WoK8Luzj9NlrLUyhhTft0eEzb9lRfwb01ISbgwoXsFlaKV4ubIR1olbgKSgHQ/riO8rk3FFDlO9CPmY03L9icrEIcuLbFrlq5APs2r07bzx0u3EbW21MS/VZf0CVH0QZPvMMwY6TAfHtczQIzVXlqbmVv3pwUz++9JB4gasYwlyBZKfG8fzlgT84HQcljqKz4Hdxw10uaF59t7RoiRcSqy+dUXfgqjCUmemsUxeAh4rYRDXQjhF6c8pj+ZeN00+T+JOuNj4teo9HDgb/R0ca0bFca6VXeVGJKcYbZ4ByXu8DqB0McTaPyLlOoVRdr+Yv0gVQk5AGGKVzTJEO04ePNQTY5xBYBRmA1fydiAvnviOSZTOpMfw8tZW3C125VK4oY53wgp45zyl3QQpQ7NtuDmx2c38wGPdRZotuQZamBSqtcwbDtLRXDoyYDkUH6Vc7JuhsN2Oj1PDOWewdrJcaOw7NbVLJ2x59Bcyw3+5/goLVSSNTIwqVQ40wPDlBECDLeMkUO5nszy8603rEfBa+0Ht1DOxj+o1LzGxzPm4V0sCG5Sg0icPIdRigbqlyK6Fc7ErzzqDuKfl/UIwZ8AxPupoCc8wB0GV8r9eYbymJXqz5WnKleMOGPDb2bBLSVxGQ4YGLhYlBF2OuCYYl5z5iasGTBJmPid88i4EhVsgoJ/qWNsuIX2soiesG86cz2fAdZTKFq+RP8YhBvVZjjQ9OLgSGKw79nePO6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199018)(31686004)(36756003)(26005)(186003)(86362001)(38100700002)(54906003)(31696002)(6506007)(2616005)(83380400001)(6486002)(6512007)(6666004)(966005)(478600001)(8676002)(66556008)(316002)(66946007)(53546011)(7416002)(5660300002)(4326008)(41300700001)(6916009)(66476007)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlpQeUgxM0xvRnBRVEszenJZSFNhWFlrWk85Zno5VUNMUnNZK2llbUZkRDM2?=
 =?utf-8?B?STNwcGFoQ0xIa2tSTVc5T3dZUVkzVUhCN3BldXlNb2l1VWNLbkRmWUdJaDlo?=
 =?utf-8?B?d2NoOHRPbjZwTFpCdytTd2NJSzdLYktMRUIybU1mUHQrcFBIUGx5bW10NHVV?=
 =?utf-8?B?blZjQ205ak0rUEFTdkpUZlFUUUVMbk50NEY3aURVNVJySlJ5cjA4amNwV3FE?=
 =?utf-8?B?ckZlQnZabExjTngwS0oyNitvcWQyRk9yL1lYVmFnbER2dXJjUnE4VlBvZ0U2?=
 =?utf-8?B?UzRlL1ZRTFJCS2J3bFQwb0FRdGJwTGhoSW94Zlp0SURUZXlvaGdobHVTazho?=
 =?utf-8?B?Tk5rb1RkTFliQjJCUUVsbXFWeXU5RE5Ec3RyUHN4VzZhRjNpTDBxZi85OVZJ?=
 =?utf-8?B?R2I0OWMvMHZrc3c2YkxsaGNDMlpDazdkbmlTQ2gzbjhWWVdiY2Z0K2d0ZTdv?=
 =?utf-8?B?VjdFSkhJVFdJVzFBY3ZvSzJqK0lXUUlRcHQ1RDhhSHl2UE54eStRSldmdVhG?=
 =?utf-8?B?dGZTWkd0YmxteWErek5EcldTTHJvOGxEM1hNT2o3Y3hnYzVWL3pLWXN3Zkcw?=
 =?utf-8?B?NnZWNnRSSWNTNW1XQThJT3JSTEpHdElhSW13MHRHK0ZtaU9QdEJLYVhYdSto?=
 =?utf-8?B?cmU0R2ZnakVtK3g3UlVGT1hHLzEySWNSaWRUTDFybllhUWwwb3hZcnNKczlY?=
 =?utf-8?B?MG4xRjl1Y1c5MnEvNFVHRjh0ZDA1SUlXM2RCdkczSEdPTXhLbTJsM2FlVU5K?=
 =?utf-8?B?a20rREx1dXlFVDJmYnY5YXJxVUNJUEZBcFVQaDZIYURNemYwbmR2blNWS3dG?=
 =?utf-8?B?SkpWNU1QdFoyZXhCODNQREZoaFZzdlV0bVR6dVZlZ0wzWmNmTnVOOU54OWU1?=
 =?utf-8?B?OSs4V3BFTHVzR2lsbWsyOHo0M0tGWEVOQXI3L3k0dlJWQnY2Mk4yc3BFaGFM?=
 =?utf-8?B?OFZEa0dHRnBVSkFSZXk1N0FoVm9wSVdabWNMK0JpT3lNd0pLSjBJWDRhcGZq?=
 =?utf-8?B?MDI1RGhHRXZ0djJtV1hMQkRYcGNHc0dRSzJJMDFqY2xNOEp6cmdQQXBoQ3pM?=
 =?utf-8?B?bTVma0NWQVJYaG5Ea1FHdUp1bHNiWVY0ZFp6ZmdMOWpSVnVMZlEyYzRRWEpT?=
 =?utf-8?B?SFFoaUl1Q3REK3QvcGxGZlhRazZ3Y3Z3K2UyeG9FTXJjRm1iR3V1QitvRHhn?=
 =?utf-8?B?RE9IcjlnNGQycGU1M0Nwb29ic2NkR3hKK0NNbjVMV0dScUkyZ0tyZngzeVNX?=
 =?utf-8?B?Z0N6NXVEUVhZbW5tLzc4dWZ6OVQ1MVF4eE1vMTFMRnRwZW1nT24vOTRzVThv?=
 =?utf-8?B?eTAwN3V5WGo4RVJ6ZUhYSlJ5ajhDNnZKMGd5RElBT29JUFNqOWRKOGNiZkVk?=
 =?utf-8?B?eFlqVjhRSi9EMzRMd2dDdXhSeS9uTVZZV1JReU44b0xKWi90eUVvWjRPME1R?=
 =?utf-8?B?T3F1ZFU2cW9lSVVlbmlJbGJ0RWRnRXpnaG43RUdLZ25pbm5zZlh1NUlRcEFz?=
 =?utf-8?B?ME1mZ0NPM1c4ZTFKMzdEZXlCcnpjMTBBNm53aWFOSGxsSzFEdFk4aCtPVHRt?=
 =?utf-8?B?dERzRzJkc2J2WUE2ZTFuWVdock1BL2RaQjFvampqckRZZXdrTENSd3pKNnR1?=
 =?utf-8?B?am5KWWN1SUJRYU4vcmlaYXlrMUVJYWlRZVhFa0UxakxNSkhQK2ZlWU1lYnp0?=
 =?utf-8?B?THRCN2ZpT1hmK3B6OGdmQnlaWlZVcUhjcmlNWVd6WGdtbzcxemxaOVhja29L?=
 =?utf-8?B?SXZ6RldmOGxqMlcxTFlrUUljNFNxaEhINWRJeHpsbWlwMEI5R0ZIUUxwTTU5?=
 =?utf-8?B?NUFqMFQ0cUt1cXZSZFhHdlU2c25iRk5VcURPUjZUUnhZVDUwNy9RK0xJMWIw?=
 =?utf-8?B?RjZ4TVo4TlZZSzZjdGpvOGZVNUl4UFlJeVh4Y2NOSEsxMGZJdC8zZUhObk8y?=
 =?utf-8?B?Z002NExFVkhYYzZxWjB4d21QaUwvZmZobHYvbzZSV0NWanJrK3pvQXFid21E?=
 =?utf-8?B?NzFqNjVnTXVtNXg2WUlsQ29mMmo4Q0pOQkhSMXlXaUZibEQrRStjNnEreThG?=
 =?utf-8?B?UEhlRE5PQy84bVFPRXFjWWlEV2lpU3hKOFE1S0Z3ZEhFWWNZcDlWYytHbVFR?=
 =?utf-8?Q?me17N+/ieOkulTDaklxoOeIbe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ea974d-671a-40b9-ee53-08db09a7cf8a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 07:40:55.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1oj6ZyGDTsnnWRzj4tCp8SndgTZfRPgxunWwAKXYifxzmoFLGRwLtUG6hVG2zmNE6lXzM7HlGPgFdtbutTfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8715

On 08.02.2023 05:51, Demi Marie Obenour wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -11,7 +11,7 @@
>   * more details.
>   *
>   * You should have received a copy of the GNU General Public License along with
> - * this program; If not, see <http://www.gnu.org/licenses/>.
> + * this program; If not, see <https://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/sched.h>

At the example of this file: While the above matches $subject, ...

> @@ -285,14 +285,14 @@ static void apply_quirks(struct pci_dev *pdev)
>           * Device [8086:2fc0]
>           * Erratum HSE43
>           * CONFIG_TDP_NOMINAL CSR Implemented at Incorrect Offset
> -         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html
> +         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v3-spec-update.html 
>           */
>          { PCI_VENDOR_ID_INTEL, 0x2fc0 },
>          /*
>           * Devices [8086:6f60,6fa0,6fc0]
>           * Errata BDF2 / BDX2
>           * PCI BARs in the Home Agent Will Return Non-Zero Values During Enumeration
> -         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html
> +         * https://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v4-spec-update.html 
>          */
>          { PCI_VENDOR_ID_INTEL, 0x6f60 },
>          { PCI_VENDOR_ID_INTEL, 0x6fa0 },

... this doesn't (and would rather belong in the earlier patch).

As to $subject: Wouldn't it be more logical to replace the license boiler
plates by SPDX headers instead? This was done to some degree on Arm
already, but I haven't gone check why it was done incompletely there.

Jan

